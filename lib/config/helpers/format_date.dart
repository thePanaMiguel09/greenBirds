import 'package:intl/intl.dart';

class FormatDate {
  static String getFormatedDate(DateTime date) {
    final formattedDate = DateFormat.yMMMMd('es_ES').format(date);
    return formattedDate;
  }
}
