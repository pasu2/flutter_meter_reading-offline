import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meter_reading_app/core/loader/loader_controller.dart';
import 'package:meter_reading_app/feature/scan_meter/controller/state/image_processing_state.dart';
import 'package:meter_reading_app/feature/scan_meter/model/request/meter_reading_request.dart';
import 'package:meter_reading_app/feature/scan_meter/usecase/insert_meter_reading_usecase.dart';
import 'package:meter_reading_app/utils/image_picker/image_cropper_provider.dart';

final imageProcessingControllerProvider =
    StateNotifierProvider<ImageProcessingController, ImageProcessingState>(
  (ref) {
    final imageCropperUtils = ref.watch(imageCropperUtilsProvider);
    final insertMeterReadingUsecase =
        ref.watch(insertMeterReadingUsecaseProvider);

    return ImageProcessingController(
      ref,
      const ImageProcessingState(),
      imageCropperUtils,
      insertMeterReadingUsecase,
    );
  },
);

class ImageProcessingController extends StateNotifier<ImageProcessingState> {
  final Ref _ref;
  final LoaderController _loader;
  final ImageCropperUtils _imageCropperUtils;
  final InsertMeterReadingUsecase _insertMeterReadingUsecase;

  ImageProcessingController(
    this._ref,
    ImageProcessingState state,
    this._imageCropperUtils,
    this._insertMeterReadingUsecase,
  )   : _loader = _ref.read(loaderControllerProvider.notifier),
        super(state);

  Future<void> setFormData({
    required String key,
    required dynamic value,
  }) async {
    state = state.copyWith(
      formData: {
        ...state.formData,
        ...{key: value},
      },
    );
  }

  void setCameraImg(XFile file) {
    state = state.copyWith(cameraImg: file.path);
  }

  void setCropImgPath(String path) {
    state = state.copyWith(cropImgPath: path);
  }

  void setMeterId(String? meterId) {
    state = state.copyWith(meterId: meterId);
  }

  void setMeterReading(String? meterReading) {
    state = state.copyWith(meterReading: meterReading);
  }

  Future<CroppedFile?> onCroppedImage(XFile file) async {
    // Get index 0 because it is single image,
    final resultCrop = await _imageCropperUtils.cropImage(file);

    state = state.copyWith(
      cameraImg: resultCrop?.path,
    );

    return resultCrop;
  }

  void onClearState({
    bool isClearCropImgPath = true,
    bool isCreateMeterId = true,
  }) {
    if (isClearCropImgPath) {
      if (isCreateMeterId) {
        state = state.copyWith(
          cameraImg: null,
          cropImgPath: null,
          meterId: null,
          meterReading: null,
          errorMsg: null,
        );
      } else {
        state = state.copyWith(
          cameraImg: null,
          cropImgPath: null,
          meterReading: null,
          errorMsg: null,
        );
      }
    } else {
      state = state.copyWith(
        cameraImg: null,
        meterId: null,
        meterReading: null,
        errorMsg: null,
      );
    }
  }

  Future<bool> onInsertMeterReading(String meterReading) async {
    _loader.onLoad();
    bool isSuccess = false;
    final cropImgPath = state.cropImgPath;

    if (cropImgPath == null) {
      _loader.onDismissLoad();
      return isSuccess;
    }

    final result = await _insertMeterReadingUsecase.execute(MeterReadingRequest(
      meterId: state.meterId,
      meterReading: meterReading,
      imgPath: cropImgPath,
    ));

    result.when(
      (success) {
        _loader.onDismissLoad();

        isSuccess = success;
      },
      (error) => _loader.onDismissLoad(),
    );

    return isSuccess;
  }
}
