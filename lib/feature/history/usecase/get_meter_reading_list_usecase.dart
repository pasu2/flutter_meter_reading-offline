import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meter_reading_app/core/application/usecase.dart';
import 'package:meter_reading_app/core/local/adapter/meter_information_model.dart';
import 'package:meter_reading_app/core/local/hive_const.dart';
import 'package:meter_reading_app/core/local/provider/meter_box_provider.dart';
import 'package:meter_reading_app/feature/history/model/response/meter_reading_response.dart';

final getMeterReadingListUsecaseProvider =
    Provider<GetMeterReadingListUsecase>((ref) {
  final meterBox = ref.read(meterBoxProvider);

  return GetMeterReadingListUsecase(
    ref,
    meterBox,
  );
});

class GetMeterReadingListUsecase
    extends UseCase<void, List<MeterReadingResponse>> {
  final Box<MeterInformationModel> _meterBox;

  GetMeterReadingListUsecase(
    Ref ref,
    this._meterBox,
  ) {
    this.ref = ref;
  }

  @override
  Future<List<MeterReadingResponse>> exec(
    void request,
  ) async {
    try {
      final meterLength = _meterBox.values.length;
      List<MeterReadingResponse> meterReadingList = [];

      for (int i = 0; i < meterLength; i++) {
        final meterData = _meterBox.getAt(i);
        meterReadingList.add(
          MeterReadingResponse(
            id: '$i',
            meterReading: meterData?.meterReading ?? '',
            meterId: meterData?.meterId ?? '',
            createAt: meterData?.createAt ?? DateTime.now(),
            updateAt: meterData?.updateAt ?? DateTime.now(),
            imgPath: meterData?.pathMeterImg ?? '',
          ),
        );
      }

      if (meterReadingList.isEmpty) {
        return [];
      }

      return meterReadingList;
    } catch (e) {
      return [];
    }
  }
}
