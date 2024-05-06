import 'dart:developer';

import 'package:flutter/material.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  List<Route<dynamic>> routes = [];

  void push(Route state) {
    final w = state;
    routes.add(w);
  }

  void removeRoute(bool Function(Route<dynamic>) shouldRemove) {
    final List<Route<dynamic>> routesToRemove = [];
    routes.forEach((element) {
      if (shouldRemove(element)) {
        routesToRemove.add(element);
      }
    });
    for (var route in routesToRemove) {
      navigator?.removeRoute(route);
      navigator?.setState(() {

      });
    }

    @override
    void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
      routes.add(route);

      super.didPush(route, previousRoute);
      log('${routes.map((e) => e.settings.name).toList()}');
    }

    @override
    void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
      routes.remove(route);
      super.didRemove(route, previousRoute);
      log('${routes.map((e) => e.settings.name).toList()}');
    }

    @override
    void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
      routes.remove(route);
      super.didPop(route, previousRoute);
      log('${routes.map((e) => e.settings.name).toList()}');
    }

    @override
    void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
      final oldIndex = oldRoute == null ? null : routes.indexOf(oldRoute);
      if (oldIndex != null && newRoute != null) {
        routes[oldIndex] = newRoute;
      }

      super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
      log('${routes.map((e) => e.settings.name).toList()}');
    }
  }
}