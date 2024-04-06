import 'package:flutter_riverpod/flutter_riverpod.dart';

final loaderControllerProvider =
    StateNotifierProvider<LoaderController, bool>((ref) {
  return LoaderController();
});

class LoaderController extends StateNotifier<bool> {
  LoaderController({bool isLoading = false}) : super(isLoading) {
    state = isLoading;
  }

  void onLoad() {
    state = true;
  }

  void onDismissLoad() {
    state = false;
  }
}
