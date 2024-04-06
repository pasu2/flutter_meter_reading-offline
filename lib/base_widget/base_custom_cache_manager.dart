import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meter_reading_app/core/cache/io_file_system.dart';

final defaultCacheManagerProvider = Provider((ref) => DefaultCacheManager());

final baseCustomCacheManagerProvider =
    Provider((ref) => BaseCustomCacheManager());

// Example code if you'd like manual code
// https://stackoverflow.com/questions/60306287/save-network-images-in-flutter-to-load-them-offline
// https://github.com/Baseflow/flutter_cache_manager/issues/238
class BaseCustomCacheManager extends CacheManager with ImageCacheManager {
  static const String key = "customCache";

  static BaseCustomCacheManager? _instance;

  BaseCustomCacheManager._()
      : super(
          Config(
            key,
            stalePeriod: const Duration(seconds: 1),
            maxNrOfCacheObjects: 1000,
            repo: JsonCacheInfoRepository(databaseName: key),
            fileSystem: IOFileSystem(key),
            fileService: HttpFileService(),
          ),
        );

  factory BaseCustomCacheManager() {
    return _instance ??= BaseCustomCacheManager._();
  }
}
