import 'package:equatable/equatable.dart';

sealed class LanguageState extends Equatable {
  final String languageCode;

  const LanguageState({required this.languageCode});

  @override
  List<Object?> get props => [languageCode];
}

final class LanguageInitial extends LanguageState {
  const LanguageInitial({required super.languageCode});
}

final class LanguageChanged extends LanguageState {
  const LanguageChanged({required super.languageCode});
}
