// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `English`
  String get En {
    return Intl.message('English', name: 'En', desc: '', args: []);
  }

  /// `Arabic`
  String get Ar {
    return Intl.message('Arabic', name: 'Ar', desc: '', args: []);
  }

  /// `Rent your car easily`
  String get onboarding_one_title {
    return Intl.message(
      'Rent your car easily',
      name: 'onboarding_one_title',
      desc: '',
      args: [],
    );
  }

  /// `Choose the car that suits you in minutes without any hassle`
  String get onboarding_one_body {
    return Intl.message(
      'Choose the car that suits you in minutes without any hassle',
      name: 'onboarding_one_body',
      desc: '',
      args: [],
    );
  }

  /// `Cars near you`
  String get onboarding_two_title {
    return Intl.message(
      'Cars near you',
      name: 'onboarding_two_title',
      desc: '',
      args: [],
    );
  }

  /// `Find nearby available cars and book instantly`
  String get onboarding_two_body {
    return Intl.message(
      'Find nearby available cars and book instantly',
      name: 'onboarding_two_body',
      desc: '',
      args: [],
    );
  }

  /// `Pay easily and securely`
  String get onboarding_three_title {
    return Intl.message(
      'Pay easily and securely',
      name: 'onboarding_three_title',
      desc: '',
      args: [],
    );
  }

  /// `Multiple secure payment methods for your peace of mind`
  String get onboarding_three_body {
    return Intl.message(
      'Multiple secure payment methods for your peace of mind',
      name: 'onboarding_three_body',
      desc: '',
      args: [],
    );
  }

  /// `Pick up and start your journey`
  String get onboarding_four_title {
    return Intl.message(
      'Pick up and start your journey',
      name: 'onboarding_four_title',
      desc: '',
      args: [],
    );
  }

  /// `Pick up your car and enjoy the ride`
  String get onboarding_four_body {
    return Intl.message(
      'Pick up your car and enjoy the ride',
      name: 'onboarding_four_body',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Started`
  String get get_started {
    return Intl.message(
      'Let’s Get Started',
      name: 'get_started',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back Ready to hit the road.`
  String get loginTitle {
    return Intl.message(
      'Welcome Back Ready to hit the road.',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `LogIn`
  String get loginButton {
    return Intl.message('LogIn', name: 'loginButton', desc: '', args: []);
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get noAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signup {
    return Intl.message('SignUp', name: 'signup', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Please enter your email`
  String get emailRequired {
    return Intl.message(
      'Please enter your email',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Please enter your password`
  String get passwordRequired {
    return Intl.message(
      'Please enter your password',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character`
  String get invalidPassword {
    return Intl.message(
      'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Join us and start your journey today.`
  String get signupTitle {
    return Intl.message(
      'Join us and start your journey today.',
      name: 'signupTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message('First Name', name: 'FirstName', desc: '', args: []);
  }

  /// `Last Name`
  String get LastName {
    return Intl.message('Last Name', name: 'LastName', desc: '', args: []);
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `phone number must be 11 digits`
  String get phoneNumberValidation {
    return Intl.message(
      'phone number must be 11 digits',
      name: 'phoneNumberValidation',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Available to add car`
  String get availableToAddCar {
    return Intl.message(
      'Available to add car',
      name: 'availableToAddCar',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signupButton {
    return Intl.message('SignUp', name: 'signupButton', desc: '', args: []);
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Please enter your first name`
  String get firstNameRequired {
    return Intl.message(
      'Please enter your first name',
      name: 'firstNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your last name`
  String get lastNameRequired {
    return Intl.message(
      'Please enter your last name',
      name: 'lastNameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get phoneNumberRequired {
    return Intl.message(
      'Please enter your phone number',
      name: 'phoneNumberRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your confirm password`
  String get confirmPasswordRequired {
    return Intl.message(
      'Please enter your confirm password',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password do not match`
  String get passwordDoNotMatch {
    return Intl.message(
      'Password do not match',
      name: 'passwordDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message('yes', name: 'yes', desc: '', args: []);
  }

  /// `no`
  String get no {
    return Intl.message('no', name: 'no', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Please enter your city`
  String get cityRequired {
    return Intl.message(
      'Please enter your city',
      name: 'cityRequired',
      desc: '',
      args: [],
    );
  }

  /// `Let’s reset your password`
  String get resetPasswordRequestTitle {
    return Intl.message(
      'Let’s reset your password',
      name: 'resetPasswordRequestTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email and we’ll guide you through the reset process.`
  String get resetPasswordRequestBody {
    return Intl.message(
      'Enter your email and we’ll guide you through the reset process.',
      name: 'resetPasswordRequestBody',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Back to Login`
  String get backToLogin {
    return Intl.message(
      'Back to Login',
      name: 'backToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Almost there!`
  String get resetPasswordOtpTitle {
    return Intl.message(
      'Almost there!',
      name: 'resetPasswordOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to your email to reset your password.`
  String get resetPasswordOtpSubtitle {
    return Intl.message(
      'Enter the code we sent to your email to reset your password.',
      name: 'resetPasswordOtpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resetPasswordOtpResend {
    return Intl.message(
      'Resend Code',
      name: 'resetPasswordOtpResend',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Set a New Password`
  String get resetPasswordNewPasswordTitle {
    return Intl.message(
      'Set a New Password',
      name: 'resetPasswordNewPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password below to secure your account.`
  String get resetPasswordNewPasswordSubtitle {
    return Intl.message(
      'Enter your new password below to secure your account.',
      name: 'resetPasswordNewPasswordSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a new password`
  String get newPasswordRequired {
    return Intl.message(
      'Please enter a new password',
      name: 'newPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailStep {
    return Intl.message('Email', name: 'emailStep', desc: '', args: []);
  }

  /// `OTP`
  String get otpStep {
    return Intl.message('OTP', name: 'otpStep', desc: '', args: []);
  }

  /// `New Password`
  String get newPasswordStep {
    return Intl.message(
      'New Password',
      name: 'newPasswordStep',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Phone Verification`
  String get phoneVerificationtitle {
    return Intl.message(
      'Phone Verification',
      name: 'phoneVerificationtitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code we sent to your phone number to verify your account.`
  String get phoneVerificationBody {
    return Intl.message(
      'Enter the code we sent to your phone number to verify your account.',
      name: 'phoneVerificationBody',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get phoneVerificationResend {
    return Intl.message(
      'Resend Code',
      name: 'phoneVerificationResend',
      desc: '',
      args: [],
    );
  }

  /// `Skip for now`
  String get skipForNow {
    return Intl.message('Skip for now', name: 'skipForNow', desc: '', args: []);
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `No item found`
  String get noItemFound {
    return Intl.message(
      'No item found',
      name: 'noItemFound',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get search {
    return Intl.message('Search...', name: 'search', desc: '', args: []);
  }

  /// `Select Location`
  String get selectLocation {
    return Intl.message(
      'Select Location',
      name: 'selectLocation',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Select City`
  String get selectCity {
    return Intl.message('Select City', name: 'selectCity', desc: '', args: []);
  }

  /// `Select Date`
  String get selectDate {
    return Intl.message('Select Date', name: 'selectDate', desc: '', args: []);
  }

  /// `Select Time`
  String get selectTime {
    return Intl.message('Select Time', name: 'selectTime', desc: '', args: []);
  }

  /// `Select Car`
  String get selectCar {
    return Intl.message('Select Car', name: 'selectCar', desc: '', args: []);
  }

  /// `Select Car Type`
  String get selectCarType {
    return Intl.message(
      'Select Car Type',
      name: 'selectCarType',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get nationalId {
    return Intl.message('National ID', name: 'nationalId', desc: '', args: []);
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message('Birth Date', name: 'birthDate', desc: '', args: []);
  }

  /// `Please enter your birth date`
  String get birthDateRequired {
    return Intl.message(
      'Please enter your birth date',
      name: 'birthDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date format`
  String get invalidDateFormat {
    return Intl.message(
      'Invalid date format',
      name: 'invalidDateFormat',
      desc: '',
      args: [],
    );
  }

  /// `You must be at least 18 years old`
  String get ageRestriction {
    return Intl.message(
      'You must be at least 18 years old',
      name: 'ageRestriction',
      desc: '',
      args: [],
    );
  }

  /// `is required`
  String get isRequired {
    return Intl.message('is required', name: 'isRequired', desc: '', args: []);
  }

  /// `Please enter your national ID`
  String get nationalIdRequired {
    return Intl.message(
      'Please enter your national ID',
      name: 'nationalIdRequired',
      desc: '',
      args: [],
    );
  }

  /// `National ID must be 14 digits`
  String get nationalIdValidation {
    return Intl.message(
      'National ID must be 14 digits',
      name: 'nationalIdValidation',
      desc: '',
      args: [],
    );
  }

  /// `Please select a country`
  String get countryRequired {
    return Intl.message(
      'Please select a country',
      name: 'countryRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please select a location`
  String get locationRequired {
    return Intl.message(
      'Please select a location',
      name: 'locationRequired',
      desc: '',
      args: [],
    );
  }

  /// `Success! Your account has been created`
  String get signupSuccess {
    return Intl.message(
      'Success! Your account has been created',
      name: 'signupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login successful! Welcome back `
  String get loginSuccess {
    return Intl.message(
      'Login successful! Welcome back ',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code that we sent to your phone number to verify your account`
  String get otpPhoneRequired {
    return Intl.message(
      'Enter the code that we sent to your phone number to verify your account',
      name: 'otpPhoneRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 4 digits`
  String get otpValidation {
    return Intl.message(
      'OTP must be 4 digits',
      name: 'otpValidation',
      desc: '',
      args: [],
    );
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Enter the code that we sent to your email to verify your account`
  String get otpEmailRequired {
    return Intl.message(
      'Enter the code that we sent to your email to verify your account',
      name: 'otpEmailRequired',
      desc: '',
      args: [],
    );
  }

  /// `OTP must be 4 digits`
  String get otpEmailValidation {
    return Intl.message(
      'OTP must be 4 digits',
      name: 'otpEmailValidation',
      desc: '',
      args: [],
    );
  }

  /// `Your Code is not correct`
  String get otpIsNotCorrect {
    return Intl.message(
      'Your Code is not correct',
      name: 'otpIsNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Password changed successfully`
  String get passwordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'passwordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Branding`
  String get Branding {
    return Intl.message('Branding', name: 'Branding', desc: '', args: []);
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
