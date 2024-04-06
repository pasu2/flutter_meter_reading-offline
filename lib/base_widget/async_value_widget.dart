import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meter_reading_app/core/error/failure.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final bool showLoading;
  final bool showError;
  final Widget? loadingWidget;
  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.showLoading = true,
    this.showError = true,
    this.loadingWidget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _loadingWidget = loadingWidget ??
        const Center(
          child: CircularProgressIndicator.adaptive(),
        );

    return value.when(
      data: data,
      error: (error, stackTrace) {
        final failure = error as Failure;
        return showError
            ? Center(
                child: Text(failure.message),
              )
            : const SizedBox.shrink();
      },
      loading: () {
        return showLoading ? _loadingWidget : const SizedBox.shrink();
      },
    );
  }
}
