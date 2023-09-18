import 'package:intl/intl.dart';

class Formater {
  static String format(int price) {
    final formater = NumberFormat('#,##0', 'id_ID');
    final format = formater.format(price);
    return format;
  }
}
