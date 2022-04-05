import 'package:logger/logger.dart';

void logOrange(dynamic message) {
  Logger().w(message);
}

void logRed(dynamic message) {
  Logger().e(message);
}
