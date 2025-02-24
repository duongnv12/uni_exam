import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime, String pattern) {
    final formatter = DateFormat(pattern);
    return formatter.format(dateTime);
  }

  static DateTime parseDateTime(String dateTimeString, String pattern) {
    final formatter = DateFormat(pattern);
    return formatter.parse(dateTimeString);
  }
}