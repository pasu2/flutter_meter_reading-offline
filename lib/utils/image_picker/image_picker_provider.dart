import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:meter_reading_app/core/error/failure.dart';
import 'package:meter_reading_app/utils/image_picker/enum/image_picker_type_enum.dart';
import 'package:meter_reading_app/utils/image_picker/model/image_picker_config_request.dart';
import 'package:meter_reading_app/utils/util/base_utils.dart';
import 'package:multiple_result/multiple_result.dart';

final imagePickerProvider = Provider<ImagePicker>((ref) {
  return ImagePicker();
});

final imagePickerUtilsProvider = Provider<ImagePickerUtils>(
  (ref) {
    final imagePicker = ref.watch(imagePickerProvider);
    final baseUtils = ref.watch(baseUtilsProvider);
    return ImagePickerUtils(imagePicker, baseUtils);
  },
);

class ImagePickerUtils {
  final ImagePicker imagePicker;
  final BaseUtils baseUtils;
  final _logging = Logger('GET_IMAGE');

  ImagePickerUtils(this.imagePicker, this.baseUtils);

  Future<Result<List<XFile?>, Failure>> getImage(
      ImagePickerConfigRequest request) async {
    try {
      final _allowFileExtension = ['.jpg', '.png'];
      final type = request.type;
      final source = request.source;
      final maxWidth = request.maxWidth;
      final maxHeight = request.maxHeight;
      final imageQuality = request.imageQuality;
      final isMaximum2MB = request.isMaximum2MB;
      const maxFileSizeInBytes = 2 *
          1048576; // 2MB (You'll probably want this outside of this function so you can reuse the value elsewhere)

      List<XFile?> picker = [];
      if (type == ImagePickerType.signle) {
        final result = await imagePicker.pickImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
        );

        if (result != null) {
          if (!baseUtils.allowFileExtension(result.path, _allowFileExtension)) {
            return const Success([]);
          }

          if (isMaximum2MB) {
            final imagePath = await result.readAsBytes();
            final fileSize = imagePath.length;
            if (fileSize > maxFileSizeInBytes) {
              return Error(
                Failure(message: 'ขนาดไฟล์เกิน 2 MB'),
              );
            }
          }
        }

        picker.add(result);
      } else {
        picker = await imagePicker.pickMultiImage(
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: imageQuality,
        );

        if (picker.isNotEmpty) {
          for (final item in picker) {
            if (!baseUtils.allowFileExtension(
              item!.path,
              _allowFileExtension,
            )) {
              return const Success([]);
            }

            if (isMaximum2MB) {
              final imagePath = await item.readAsBytes();
              final fileSize = imagePath.length;
              if (fileSize <= maxFileSizeInBytes) {
                return Error(
                  Failure(message: 'ขนาดไฟล์เกิน 2 MB'),
                );
              }
            }
          }
        }
      }
      if (Platform.isAndroid) {
        final response = await imagePicker.retrieveLostData();

        final List<XFile>? files = response.files;
        if (files != null) {
          return Success(files);
        }
      }

      final res = picker;
      return Success(res);
    } catch (e) {
      _logging.warning(e);
      return Error(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }
}
