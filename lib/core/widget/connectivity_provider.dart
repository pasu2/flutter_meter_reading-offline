import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provide DeviceInfoPlugin instance
final connectivityProvider = Provider<Connectivity>((ref) {
  return Connectivity();
});
