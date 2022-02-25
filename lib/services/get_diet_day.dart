import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../widgets/calendar_timeline.dart';
import 'package:intl/intl.dart';
import '../models/http_exception.dart';
import '../models/diet_day.dart';

final getDietDayProvider = FutureProvider<DietDay>((ref) async {
  final selectedDate = ref.watch(dateTimeProvider);
  final dietDay = getDietDay(selectedDate);
  // final dietTypeProvider = Provider((ref) => dietDay.diet.type);
  return dietDay;
});

Future<DietDay> getDietDay(date) async {
  final response = await http.post(
    Uri.parse('https://test-api.myproportion.com/api/v1/public/diet-for-ada'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'date': DateFormat("yyyy-MM-dd").format(date),
    }),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> dietDayMap = jsonDecode(response.body);
    return DietDay.fromJson(dietDayMap);
  } else if (response.statusCode == 204) {
    return DietDay();
  } else {
    throw HttpException('Diet doesn\'t exist, we have bug.');
  }
}
