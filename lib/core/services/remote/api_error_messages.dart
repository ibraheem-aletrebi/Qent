class ApiErrorMessages {
  static const Map<String, _ErrorText> _messages = {
    'connectionTimeout': _ErrorText(
      en: (
        'Connection timed out.',
        'Please check your internet connection and try again.',
      ),
      ar: (
        'انتهت مهلة الاتصال.',
        'يرجى التحقق من اتصال الإنترنت والمحاولة مرة أخرى.',
      ),
    ),
    'sendTimeout': _ErrorText(
      en: (
        'Request took too long to send.',
        'Please check your connection and try again.',
      ),
      ar: (
        'استغرقت عملية الإرسال وقتاً طويلاً.',
        'يرجى التحقق من اتصالك والمحاولة مرة أخرى.',
      ),
    ),
    'receiveTimeout': _ErrorText(
      en: (
        'Server response took too long.',
        'Please try again in a few moments.',
      ),
      ar: (
        'استغرقت استجابة الخادم وقتاً طويلاً.',
        'يرجى المحاولة مرة أخرى بعد قليل.',
      ),
    ),
    'noInternet': _ErrorText(
      en: (
        'No internet connection detected.',
        'Please connect to the internet and try again.',
      ),
      ar: (
        'لا يوجد اتصال بالإنترنت.',
        'يرجى الاتصال بالإنترنت والمحاولة مرة أخرى.',
      ),
    ),
    'badCertificate': _ErrorText(
      en: (
        'Security certificate verification failed.',
        'Please update the app or contact support.',
      ),
      ar: (
        'فشل التحقق من شهادة الأمان.',
        'يرجى تحديث التطبيق أو التواصل مع الدعم الفني.',
      ),
    ),
    'cancelled': _ErrorText(
      en: (
        'Request was cancelled.',
        'You can try again whenever you\'re ready.',
      ),
      ar: ('تم إلغاء الطلب.', 'يمكنك المحاولة مرة أخرى في أي وقت.'),
    ),

    'unauthorized': _ErrorText(
      en: (
        'Invalid email or password.',
        'Please check your credentials and try again.',
      ),
      ar: (
        'البريد الإلكتروني أو كلمة المرور غير صحيحة.',
        'يرجى التحقق من بيانات الدخول والمحاولة مرة أخرى.',
      ),
    ),

    'sessionExpired': _ErrorText(
      en: ('Your session has expired.', 'Please log in again to continue.'),
      ar: ('انتهت صلاحية الجلسة.', 'يرجى تسجيل الدخول مرة أخرى للمتابعة.'),
    ),

    'forbidden': _ErrorText(
      en: (
        'You don\'t have permission to access this.',
        'Please contact support if you think this is a mistake.',
      ),
      ar: (
        'ليس لديك صلاحية الوصول إلى هذا المحتوى.',
        'يرجى التواصل مع الدعم إذا كنت تعتقد أن هذا خطأ.',
      ),
    ),

    'notFound': _ErrorText(
      en: (
        'Account not found.',
        'Please check the email address or create a new account.',
      ),
      ar: (
        'الحساب غير موجود.',
        'يرجى التحقق من البريد الإلكتروني أو إنشاء حساب جديد.',
      ),
    ),

    'conflict': _ErrorText(
      en: (
        'This information already exists.',
        'Please try with different details.',
      ),
      ar: ('هذه المعلومات موجودة بالفعل.', 'يرجى المحاولة ببيانات مختلفة.'),
    ),

    'validation': _ErrorText(
      en: (
        'Please check the information you entered.',
        'Make sure all fields are filled correctly.',
      ),
      ar: (
        'يرجى مراجعة المعلومات التي أدخلتها.',
        'تأكد من ملء جميع الحقول بشكل صحيح.',
      ),
    ),

    'serverError': _ErrorText(
      en: (
        'Something went wrong on our end.',
        'Our team has been notified. Please try again later.',
      ),
      ar: (
        'حدث خطأ من جهة الخادم.',
        'تم إبلاغ فريق الدعم. يرجى المحاولة مرة أخرى لاحقاً.',
      ),
    ),

    'unknown': _ErrorText(
      en: (
        'An unexpected error occurred.',
        'Please try again. If the problem persists, contact support.',
      ),
      ar: (
        'حدث خطأ غير متوقع.',
        'يرجى المحاولة مرة أخرى. إذا استمرت المشكلة، تواصل مع الدعم الفني.',
      ),
    ),
  };

  static (String message, String action) get(
    String key, {
    bool isArabic = false,
  }) {
    final text = _messages[key] ?? _messages['unknown']!;
    return isArabic ? text.ar : text.en;
  }
}

class _ErrorText {
  final (String, String) en;
  final (String, String) ar;
  const _ErrorText({required this.en, required this.ar});
}
