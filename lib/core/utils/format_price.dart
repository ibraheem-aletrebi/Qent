import 'package:intl/intl.dart';

String formatEGP( {required num amount,required String locale}) {
  final isArabic = locale.startsWith('ar');

  final formatter = NumberFormat.currency(
    locale: isArabic ? 'ar_EG' : 'en_EG',
    symbol: isArabic ? 'ج.م' : 'EGP ',
    decimalDigits: 2,
  );

  return formatter.format(amount);
}
