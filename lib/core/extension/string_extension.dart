import '../constant/regex/regex_constant.dart';

extension StringExtension on String {
  String? get isValidEmail =>
      contains(RegExp(RegexConstant.EMAIL_REGEX)) && isNotEmpty
          ? null
          : 'Geçerli bir e-posta giriniz!';

  String? get isValidPassword => length < 6 ? 'En az 6 karakter' : null;

  // String? get isValidPassword => contains(
  //             RegExp(RegexConstant.PASSWORD_REGEX)) &&
  //         isNotEmpty
  //     ? null
  //     : 'Şifre en az 8 karakter olmalı. En az bir büyük karakter ve en az bir rakam içermelidir.';
}
