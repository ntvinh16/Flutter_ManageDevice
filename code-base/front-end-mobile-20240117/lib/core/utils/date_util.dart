import 'package:intl/intl.dart';

class DateUtil {
  static const String DDMMYYYY = 'dd/MM/yyyy';
  static const String HHMM_DDMMYYYY = 'dd/MM/yyyy HH:mm';

  static String getDateStr(DateTime? dateTime, {String formatStr = DDMMYYYY}) {
    var format = DateFormat(formatStr);

    if (dateTime == null) {
      return '';
    }
    return format.format(dateTime);
  }

  static String getTimeFromNumber(int? number) {
    if (number == null) {
      return '';
    }
    var min = number % 100;
    return '${number ~/ 100}: ${min == 0 ? '00' : min}';
  }
}
