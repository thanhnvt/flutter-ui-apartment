import 'package:intl/intl.dart';

// Function to format a number as currency (dollar)
String formatCurrency(int amount) {
  final formatter = NumberFormat.simpleCurrency(locale: 'en_US');
  return formatter.format(amount);
}