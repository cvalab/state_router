import 'package:flutter/material.dart';
import 'package:state_router/pages/default_page.dart';
import 'package:state_router/states/about_state.dart';
import 'package:state_router/strategy_builder/strategy.dart';

import 'pages/about_page.dart';

class StateRouter {
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

  List<Page<dynamic>> getPages(Object state) {
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

