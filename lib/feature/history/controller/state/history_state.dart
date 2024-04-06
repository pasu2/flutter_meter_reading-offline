import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meter_reading_app/feature/history/model/response/meter_reading_response.dart';

part 'history_state.freezed.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default({}) final Map<String, dynamic> formData,
    @Default(AsyncValue.loading())
    AsyncValue<List<MeterReadingResponse>?> meterReadingList,
    @Default([]) List<MeterReadingResponse> searchMeterReadingList,
    String? meterId,
    DateTime? searchDate,
  }) = _HistoryState;
}
