import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: args,
    );
  }

  navigateToAndReplacement(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: args,
    );
  }

  navigateToAndRemove(String routeName, {Object? args}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: args);
  }

  pop() {
    return navigatorKey.currentState!.pop();
  }
}
