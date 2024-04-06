import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncUtils {
  static AsyncValue<List<T>> merge<T>(
    Iterable<AsyncValue<T>> items,
  ) {
    final List<T> data = [];

    for (final item in items) {
      if (item is AsyncLoading) {
        return AsyncLoading<List<T>>();
      }

      if (item is AsyncError) {
        return AsyncError<List<T>>(
          (item as AsyncError).error,
          (item as AsyncError).stackTrace,
        );
      }

      if (item is AsyncData<T>) {
        data.add(item.value);
      }
    }

    return AsyncData<List<T>>(data);
  }
}

extension Unwrap<T> on AsyncValue<T> {
  T unwrap([T? defaultValue]) {
    return maybeWhen(data: (data) => data, orElse: () => defaultValue!);
  }
}
