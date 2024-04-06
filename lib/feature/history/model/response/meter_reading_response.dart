import 'package:freezed_annotation/freezed_annotation.dart';

part 'meter_reading_response.freezed.dart';
part 'meter_reading_response.g.dart';

@immutable
@freezed
class MeterReadingResponse with _$MeterReadingResponse {
  const factory MeterReadingResponse({
    required String id,
    required String meterReading,
    required String meterId,
    required String imgPath,
    required DateTime createAt,
    required DateTime updateAt,
  }) = _MeterReadingResponse;

  factory MeterReadingResponse.fromJson(Map<String, dynamic> json) =>
      _$MeterReadingResponseFromJson(json);
}
