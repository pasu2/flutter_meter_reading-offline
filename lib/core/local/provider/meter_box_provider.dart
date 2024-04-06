import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/hive_const.dart';

final meterBoxProvider = Provider<Box<MeterInformationModel>>((ref) {
  return Hive.box<MeterInformationModel>(meterBox);
});
