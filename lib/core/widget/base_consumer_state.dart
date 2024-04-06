import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:meter_reading_app/core/widget/connectivity_provider.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseConsumerState<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> with RestorationMixin<T>, WidgetsBindingObserver {
  CompositeSubscription get compositeSubscription => CompositeSubscription();

  Logger get log => Logger(T.toString());

  @override
  void initState() {
    super.initState();
    log.info('initState');
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    compositeSubscription.dispose();
    log.info('dispose');
    super.dispose();
  }

  @override
  String? get restorationId => T.toString();

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO(richard): override from child class.
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<ConnectivityResult> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final connectivity = ref.read(connectivityProvider);
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log.info('Couldn\'t check connectivity status', e);
    }

    return result;
  }

  // Check for network connection
  void checkNetworkConnection() async {
    final result = await initConnectivity();
    if (result == ConnectivityResult.mobile) {
      return;
    } else if (result == ConnectivityResult.wifi) {
      return;
    } else {
      if (!mounted) return;
      // TODO: redirect to connection error screen
      // Navigator.pushNamed(context, connectionErrorRoute);
    }
  }
}
