import 'package:flutter/material.dart';
import 'package:state_router/pages/default_page.dart';
import 'package:state_router/states/app_states.dart';
import 'package:state_router/transformer/strategy_builder/strategy.dart';

import '../observer/custom_navigator_observer.dart';
import '../pages/about_page.dart';

class StateRouter {
  get observer => CustomNavigatorObserver();

  Route routeBuilder(Object state) {
    if (state is AboutState) {
      return Route(
          state: AboutState,
          widget: AboutPage(
            title: state.name,
          ),
          strategy: const SingleTop());
    }
    //
    else {
      return const Route(
          state: DefaultPage, widget: DefaultPage(), strategy: Standard());
    }
  }

  List<Route> routes = [];

  void changeState(Object state) {
    final w = routeBuilder(state);
    //TODO: Add strategy handler
    routes.add(w);
  }

  void addRoute(Route route) {
    routes.add(route);
  }

  void pop() {
    routes.removeLast();
  }

  List<Page<dynamic>> getPages() {
    return routes.map((e) => MaterialPage(child: e.widget)).toList();
  }
}

@immutable
class Route {
  const Route(
      {required this.state,
      required this.widget,
      this.strategy = const Standard()});

  final Strategy? strategy;
  final Widget widget;
  final Type state;

  equals(Route route) {
    return route.state == state;
  }
}

