import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  Future<dynamic> navigateFromDrawerTo(Widget widget, String routeName) {
    var state = (widget.key as GlobalKey<NavigatorState>).currentState;
    return state.pushNamed(routeName);
  }

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithArguments(
    String routeName, {
    Object arguments,
  }) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  void navigateToPreviousScreen(BuildContext context) {
    if (navigatorKey.currentState.canPop()) {
      navigatorKey.currentState.pop(context);
    }
  }
}
