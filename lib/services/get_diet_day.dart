import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/http_exception.dart';
import '../models/diet_day.dart';

Future<DietDay> getDietDay() async {
  final response = await http.post(
    Uri.parse('https://api.myproportion.com/api/v1/public/diet-for-ada'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'date': '2021-06-21', // z providera wstrzyknąć initialDateProvider
    }),
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> dietDayMap = jsonDecode(response.body);

    return DietDay.fromJson(dietDayMap);
  } else if (response.statusCode == 204) {
    return DietDay();
  } else {
    throw HttpException('DietDay does not exist.');
  }
}
