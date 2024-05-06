
//Standard
//SingleTop
//SingleTask
//SingleInstance
//SingleInstancePerTask
abstract class Strategy<R> {
  List<R> routeBuilder({required List<R> routes, required R route});
}

// A -> B -> C -> D
// +B
// A -> B -> C -> D -> B
class Standard<R> implements Strategy {
  const Standard();

  @override
  List routeBuilder({required List routes, required route}) {
    final List<R> res = [...routes, route];
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
  List routeBuilder({required List routes, required route}) {
    if (routes.contains(route)) {
      return List.from(routes);
    } else {
      return [...routes, route];
    }
  }
}

class SingleTask implements Strategy {
  const SingleTask();

  @override
  List routeBuilder({required List routes, required route}) {
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
  List routeBuilder({required List routes, required route}) {
    if (routes.contains(route)) {
      return List.from(routes);
    } else {
      return [...routes, route];
    }
  }
}

class SingleInstancePerTask implements Strategy {
  const SingleInstancePerTask();

  @override
  List<Object> routeBuilder({required List routes, required route}) {
    List<Object> newRoutes = List.from(routes);
    if (newRoutes.contains(route)) {
      newRoutes.remove(route);
    }
    newRoutes.add(route);
    return newRoutes;
  }
}
