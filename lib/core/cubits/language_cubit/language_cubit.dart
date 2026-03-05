import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quent/core/constants/hive_keys.dart';
import 'package:quent/core/cubits/language_cubit/language_state.dart';
import 'package:quent/core/services/local/local_storage_helper.dart';
import 'package:quent/core/services/remote/api_error_handler.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageInitial(languageCode: 'en')) {
    getSavedLanguage();
  }

  String currentLangCode = 'en';

  //Language Change
  void getSavedLanguage() {
    final result = LocalStorageHelper().contains(HiveKeys.languageCode)
        ? LocalStorageHelper().getValue<String>(HiveKeys.languageCode)
        : 'en';
    currentLangCode = result!;
    ApiErrorHandler().isArabic = isArabic();
    emit(LanguageChanged(languageCode: currentLangCode));
  }

  Future<void> changeLanguage(String langCode) async {
    await LocalStorageHelper().setValue<String>(
      HiveKeys.languageCode,
      langCode,
    );
    currentLangCode = langCode;
    ApiErrorHandler().isArabic = isArabic();
    emit(LanguageChanged(languageCode: currentLangCode));
  }

  bool isArabic() {
    return currentLangCode == 'ar';
  }
}
