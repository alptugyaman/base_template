import 'package:intl/intl.dart';

String convertToUTC() {
  final DateTime nowUTC = DateTime.now().toUtc();

  final String formattedUTC =
      DateFormat('dd-MM-yyyy HH:mm:ss', 'en_US').format(nowUTC);

  return formattedUTC;
}
