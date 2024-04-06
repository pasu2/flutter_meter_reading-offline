import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:meter_reading_app/core/application/usecase.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/provider/meter_box_provider.dart';
import 'package:meter_reading_app/feature/scan_meter/model/request/meter_reading_request.dart';
import 'package:meter_reading_app/utils/util/base_utils.dart';

final insertMeterReadingUsecaseProvider =
    Provider<InsertMeterReadingUsecase>((ref) {
  final meterBox = ref.read(meterBoxProvider);
  return InsertMeterReadingUsecase(
    ref,
    meterBox,
  );
});

class InsertMeterReadingUsecase extends UseCase<MeterReadingRequest, bool> {
  final Box<MeterInformationModel> meterBox;

  InsertMeterReadingUsecase(
    Ref ref,
    this.meterBox,
  ) {
    this.ref = ref;
  }

  @override
  Future<bool> exec(
    MeterReadingRequest request,
  ) async {
    try {
      final meterReading = request.meterReading;
      final meterId = request.meterId;
      final imgPath = request.imgPath;

      final myData = MeterInformationModel(
        meterReading: meterReading,
        meterId: meterId,
        pathMeterImg: imgPath,
        createAt: DateTime.now(),
        updateAt: DateTime.now(),
      );

      await meterBox.add(myData);

      return true;
    } catch (e) {
      return false;
    }
  }
}
