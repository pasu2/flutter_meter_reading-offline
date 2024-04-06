// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meter_reading_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeterReadingResponseImpl _$$MeterReadingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MeterReadingResponseImpl(
      meterReading: json['meterReading'] as String? ?? '',
      meterId: json['meterId'] as String? ?? '',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$$MeterReadingResponseImplToJson(
        _$MeterReadingResponseImpl instance) =>
    <String, dynamic>{
      'meterReading': instance.meterReading,
      'meterId': instance.meterId,
      'error': instance.error,
    };
