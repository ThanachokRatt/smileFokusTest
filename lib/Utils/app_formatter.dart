import 'package:intl/intl.dart';

class AppFormatter {
  static String formatNumber(int number) {
    return NumberFormat.decimalPattern().format(number);
  }
}
