import '../app/app_constants.dart';

class UrlConstant {
  static const _URL = AppConstant.BASE_URL;

  //////      AUTH      //////
  static const LOGIN = _URL + 'user/login';
  static const REGISTER = _URL + 'user/register';
  static const ACTIVITY = _URL + 'definition/data/bygroup/daily_question';
}
