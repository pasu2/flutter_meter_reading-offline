import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

part 'image_processing_state.freezed.dart';

@freezed
class ImageProcessingState with _$ImageProcessingState {
  const factory ImageProcessingState({
    @Default({}) final Map<String, dynamic> formData,
    String? cameraImg,
    String? cropImgPath,
    String? meterId,
    String? meterReading,
    String? errorMsg,
  }) = _ImageProcessingState;
}
