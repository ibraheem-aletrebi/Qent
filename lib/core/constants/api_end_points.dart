class ApiEndPoints {
  // Authentication endPoints
  static const String login = '/auth/login/';
  
  static const String forgotPasswordRequest = '/auth/forgot_password/';
  static const String resetPasswordRequest = '/auth/reset_password/';

  static const String logout = '/auth/logout/';
  static const String signup = '/auth/register/';
  static const String countries = '/public/countries';
  static const String locations = '/public/register_locations';
  // verify phone
  static const String verifyPhoneSendCode = '/auth/phone/request_verify_code/';
  static const String verifyPhoneResendCode = '/auth/phone/resend_verify_code/';
  static const String verifyPhoneConfirm = '/auth/phone/confirm_verify_code/';

  // brand
  static const String brands = '/brands';
}
