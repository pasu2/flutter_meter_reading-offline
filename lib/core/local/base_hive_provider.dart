import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/hive_const.dart';

final baseHiveProvider = Provider<HiveProvider>((ref) => HiveProvider(ref));

class HiveProvider {
  final Ref _ref;

  HiveProvider(this._ref);

  Future<void> init() async {
    await Hive.initFlutter(hiveDbPath);

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter<MeterInformationModel>(
        MeterInformationModelAdapter(),
      );
    }

    await Hive.openBox<MeterInformationModel>(meterBox);
  }
}
