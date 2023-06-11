import 'package:intl/intl.dart';

///Date and time converter
class SpaceXDateConverter {
  ///Data conversion function
  static String convertDate(String value){
    return
      '${value.substring(8, 10)}/${value.substring(5,7)}/${value.substring(0, 4)}';
  }

  ///Time conversion function
  static String convertTime(String value){
    final apiTime = DateTime.parse(value);
    ///Time converting to your local country time
    ///Use .toUtc() instead .toLocal() for UTC time
    final convertedTime = DateFormat.jm().format(apiTime.toLocal());
    return convertedTime;
  }
}
