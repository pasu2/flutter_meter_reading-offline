// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_information_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MeterInformationModelAdapter extends TypeAdapter<MeterInformationModel> {
  @override
  final int typeId = 1;

  @override
  MeterInformationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MeterInformationModel(
      meterId: fields[1] as String?,
      meterReading: fields[2] as String?,
      createAt: fields[3] as DateTime?,
      updateAt: fields[4] as DateTime?,
      pathMeterImg: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MeterInformationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.meterId)
      ..writeByte(2)
      ..write(obj.meterReading)
      ..writeByte(3)
      ..write(obj.createAt)
      ..writeByte(4)
      ..write(obj.updateAt)
      ..writeByte(5)
      ..write(obj.pathMeterImg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MeterInformationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
