import 'package:hive/hive.dart';

part 'meter_information_model.g.dart';

@HiveType(typeId: 1)
class MeterInformationModel extends HiveObject {
  @HiveField(1)
  String? meterId;

  @HiveField(2)
  String? meterReading;

  @HiveField(3)
  DateTime? createAt;

  @HiveField(4)
  DateTime? updateAt;

  @HiveField(5)
  String? pathMeterImg;

  MeterInformationModel({
    this.meterId,
    this.meterReading,
    this.createAt,
    this.updateAt,
    this.pathMeterImg,
  });
}
