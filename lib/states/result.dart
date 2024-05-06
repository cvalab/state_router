sealed class Route {}

class HomeRoute extends Route {
  final String name;

  HomeRoute({this.name = ''});

  @override
  String toString() {
    return 'HomeRoute';
  }

  @override
  bool operator ==(Object other) {
    if (runtimeType == other.runtimeType) return true;
    return false;
  }

  @override
  int get hashCode => name.hashCode;
}

class AboutRoute extends Route {
  final String name;

  AboutRoute(this.name);
  @override
  bool operator ==(Object other) {
    if (runtimeType == other.runtimeType) return true;
    return false;
  }

  @override
  int get hashCode => name.hashCode;
  @override
  String toString() {
    return 'AboutRoute';
  }
}
