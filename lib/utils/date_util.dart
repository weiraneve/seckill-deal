import 'package:intl/intl.dart';

String formatDateTime(String dateTimeStr) {
  try {
    DateTime dateTime = DateTime.parse(dateTimeStr);
    return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
  } catch (e) {
    return '';
  }
}
