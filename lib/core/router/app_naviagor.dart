import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provide DeviceInfoPlugin instance
final appNavigatorProvider = Provider<AppNavigator>((ref) {
  return AppNavigator();
});

class AppNavigator {
  final navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _currentState => navigatorKey.currentState!;

  @optionalTypeArgs
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _currentState.pushNamed<T>(routeName, arguments: arguments);
  }

  @optionalTypeArgs
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _currentState.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  @optionalTypeArgs
  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    return _currentState.pushNamedAndRemoveUntil(
      newRouteName,
      predicate,
      arguments: arguments,
    );
  }

  @optionalTypeArgs
  void pop<T extends Object?>([T? result]) {
    _currentState.pop<T>(result);
  }

  void popUntil(RoutePredicate predicate) {
    _currentState.popUntil(predicate);
  }

  bool canPop() {
    return _currentState.canPop();
  }
}
