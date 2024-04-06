import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/core/application/usecase.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/provider/meter_box_provider.dart';
import 'package:meter_reading_app/feature/scan_meter/model/request/meter_reading_request.dart';

final editMeterReadingUsecaseProvider =
    Provider<EditMeterReadingUsecase>((ref) {
  final meterBox = ref.read(meterBoxProvider);
  return EditMeterReadingUsecase(
    ref,
    meterBox,
  );
});

class EditMeterReadingUsecase extends UseCase<MeterReadingRequest, bool> {
  final Box<MeterInformationModel> _meterBox;

  EditMeterReadingUsecase(
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
      final imgPath = request.imgPath;
      final meterReading = request.meterReading;
      final meterId = request.meterId;

      final myData = MeterInformationModel(
        pathMeterImg: imgPath,
        meterReading: meterReading,
        meterId: meterId,
        updateAt: DateTime.now(),
      );

      await _meterBox.putAt(int.parse('$id'), myData);

      return true;
    } catch (e) {
      return false;
    }
  }
}
