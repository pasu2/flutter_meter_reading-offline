import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meter_reading_app/core/application/custom_platform.dart';
import 'package:permission_handler/permission_handler.dart' as permission_lib;

final basePermissionHandlerProvider =
    Provider((ref) => BasePermissionHandler());

class BasePermissionHandler {
  Future<bool> _requestPermission(permission_lib.Permission permission) async {
    try {
      final _permissionStatus = await permission.status;
      if (_permissionStatus.isGranted) {
        return true;
      } else if (!_permissionStatus.isPermanentlyDenied) {
        final newStatus = await permission.request();
        if (newStatus.isGranted) {
          return true;
        }
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> requestCameraPermission() async {
    return _requestPermission(permission_lib.Permission.camera);
  }

  Future<bool> requestPhotosPermission() async {
    return _requestPermission(permission_lib.Permission.photos);
  }

  Future<bool> requestSaveImagePermission() async {
    return CustomPlatform.isAndroid
        ? _requestPermission(permission_lib.Permission.storage)
        : _requestPermission(permission_lib.Permission.photosAddOnly);
  }

  Future<bool> requestStoragePermission() async {
    return _requestPermission(permission_lib.Permission.storage);
  }

  void openAppSettings() {
    permission_lib.openAppSettings();
  }
}
