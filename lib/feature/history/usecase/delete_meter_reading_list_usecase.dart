import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/core/application/usecase.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/provider/meter_box_provider.dart';
import 'package:meter_reading_app/feature/scan_meter/model/request/meter_reading_request.dart';

final deleteMeterReadingListUsecaseProvider =
    Provider<DeleteMeterReadingListUsecase>((ref) {
  final meterBox = ref.read(meterBoxProvider);

  return DeleteMeterReadingListUsecase(
    ref,
    meterBox,
  );
});

class DeleteMeterReadingListUsecase extends UseCase<MeterReadingRequest, bool> {
  final Box<MeterInformationModel> _meterBox;

  DeleteMeterReadingListUsecase(
    Ref ref,
    this._meterBox,
  ) {
    this.ref = ref;
  }

  @override
  Future<bool> exec(
    MeterReadingRequest request,
  ) async {
    try {
      final id = request.id;

      await _meterBox.deleteAt(int.parse('$id'));
      return true;
    } catch (e) {
      return false;
    }
  }
}
