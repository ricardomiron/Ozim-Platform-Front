import 'package:charity_app/utils/utils.dart';
import 'package:intl/intl.dart';

String currencyFormatter(double number, {decimalDigit = 2}) {
  final formatCurrency = NumberFormat.currency(
      locale: "en_US", symbol: "", decimalDigits: decimalDigit);
  return formatCurrency.format(number).replaceAll(",", " ");
}

String dateFormatter(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy hh:mm');

  return formatter.format(date);
}

String dateFormatter2(DateTime date) {
  final formatter = DateFormat('dd.MM.yyyy');

  return formatter.format(date);
}

getDate(date, {milliseconds = false}) {
  DateTime realdate;
  if (date is DateTime) {
    realdate = date;
  } else if (date is String) {
    realdate = DateTime.parse(date);
  } else if (date is num) {
    realdate =
        DateTime.fromMillisecondsSinceEpoch(date * (milliseconds ? 1 : 1000));
  } else {
    print('Error parsing time', level: 1);
  }
  return realdate;
}

String dateFormatterEng(dynamic date) {
  DateTime realdate = getDate(date);
  final formatter = DateFormat('yyyy/MM/dd');
  return realdate == null ? null : formatter.format(realdate);
}
