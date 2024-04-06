// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeterReadingResponseImpl _$$MeterReadingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeterReadingResponseImpl(
      id: json['id'] as String,
      meterReading: json['meterReading'] as String,
      meterId: json['meterId'] as String,
      imgPath: json['imgPath'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      updateAt: DateTime.parse(json['updateAt'] as String),
    );

Map<String, dynamic> _$$MeterReadingResponseImplToJson(
        _$MeterReadingResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meterReading': instance.meterReading,
      'meterId': instance.meterId,
      'imgPath': instance.imgPath,
      'createAt': instance.createAt.toIso8601String(),
      'updateAt': instance.updateAt.toIso8601String(),
    };
