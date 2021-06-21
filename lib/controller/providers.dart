import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/diet_day.dart';
import '../services/get_diet_day.dart';

final getDietDayProvider = FutureProvider<DietDay>((ref) async {
  return getDietDay();
});
