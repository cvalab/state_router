import 'package:flutter/cupertino.dart';

//Standard
//SingleTop
//SingleTask
//SingleInstance
//SingleInstancePerTask
@immutable
abstract class Strategy<K> {
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route});
}

// A -> B -> C -> D
// +B
// A -> B -> C -> D -> B
class Standard implements Strategy {
  const Standard();

  @override
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route}) {
    final List<Object> res = [...routes, route];
    return res;
  }
}

// A -> B -> C -> D
// +D
// A -> B -> C -> D
// +B
// A -> B -> C -> D -> B
class SingleTop implements Strategy {
  const SingleTop();

  @override
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route}) {
    if (routes.isNotEmpty) {
      routes.removeLast();
    }
    return routes;
  }
}

class SingleTask implements Strategy {
  const SingleTask();

  @override
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route}) {
    int index = routes.indexOf(route);
    if (index != -1) {
      return routes.sublist(0, index + 1);
    } else {
      return [...routes, route];
    }
  }
}

class SingleInstance implements Strategy {
  const SingleInstance();

  @override
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route}) {
    if (routes.contains(route)) {
      return List<Object>.from(routes);
    } else {
      return [...routes, route];
    }
  }
}

class SingleInstancePerTask implements Strategy {
  const SingleInstancePerTask();

  @override
  List<Object> routeBuilder(
      {required List<Object> routes, required Object route}) {
    List<Object> newRoutes = List<Object>.from(routes);
    if (newRoutes.contains(route)) {
      newRoutes.remove(route);
    }
    newRoutes.add(route);
    return newRoutes;
  }
}