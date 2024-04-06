import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

final imageCropperProvider = Provider<ImageCropper>((ref) {
  return ImageCropper();
});

/// Provider logger available only in debug mode
final imageCropperUtilsProvider = Provider<ImageCropperUtils>((ref) {
  final imageCropper = ref.watch(imageCropperProvider);

  return ImageCropperUtils(imageCropper);
});

class ImageCropperUtils {
  final ImageCropper imageCropper;

  ImageCropperUtils(this.imageCropper);

  /// Enable logging only in debug mode
  Future<CroppedFile?> cropImage(XFile? _pickedFile) async {
    final croppedFile = await imageCropper.cropImage(
      sourcePath: _pickedFile!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );

    return croppedFile;
  }
}
