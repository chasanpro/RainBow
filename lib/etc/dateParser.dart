// ignore: file_names
import 'package:intl/intl.dart';

String addDay(String date, int days) {
  var format = DateFormat('dd/MM/yyyy');
  String date0 = format.parse(date).toString();

  return nextDateParser(
      (DateTime.parse(date0)).add(Duration(days: days)).toString());
}

String monthParser(String currentDate) {
  var format = DateFormat('dd/MM/yyyy');
  DateTime date = format.parse(currentDate);
  var newFormat = DateFormat('MMM, d');
  return newFormat.format(date);
}

String nextDateParser(String date_) {
  var format = DateFormat('yyyy-MM-dd');
  DateTime date = format.parse(date_);
  var newFormat = DateFormat('MMM, d');
  return newFormat.format(date);
}
