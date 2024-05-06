import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

class NavigatorLet<T> extends Navigator {

  const NavigatorLet({
    super.key,
    super.pages = const <Page<dynamic>>[],
    super.onPopPage,
    super.initialRoute,
    super.onGenerateInitialRoutes = Navigator.defaultGenerateInitialRoutes,
    super.onGenerateRoute,
    super.onUnknownRoute,
    super.transitionDelegate = const DefaultTransitionDelegate<dynamic>(),
    super.reportsRouteUpdateToEngine = false,
    super.clipBehavior = Clip.hardEdge,
    super.observers = const <NavigatorObserver>[],
    super.requestFocus = true,
    super.restorationScopeId,
    super.routeTraversalEdgeBehavior = kDefaultRouteTraversalEdgeBehavior,
  });


  @override
  // TODO: implement clipBehavior
  Clip get clipBehavior => throw UnimplementedError();

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }

  @override
  NavigatorState createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  List<DiagnosticsNode> debugDescribeChildren() {
    // TODO: implement debugDescribeChildren
    throw UnimplementedError();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    // TODO: implement debugFillProperties
  }

  @override
  // TODO: implement initialRoute
  String? get initialRoute => throw UnimplementedError();

  @override
  // TODO: implement key
  Key? get key => throw UnimplementedError();

  @override
  // TODO: implement observers
  List<NavigatorObserver> get observers => super.observers;

  @override
  // TODO: implement onGenerateInitialRoutes
  RouteListFactory get onGenerateInitialRoutes => throw UnimplementedError();

  @override
  // TODO: implement onGenerateRoute
  RouteFactory? get onGenerateRoute => throw UnimplementedError();

  @override
  // TODO: implement onPopPage
  PopPageCallback? get onPopPage => throw UnimplementedError();

  @override
  // TODO: implement onUnknownRoute
  RouteFactory? get onUnknownRoute => throw UnimplementedError();

  @override
  // TODO: implement pages
  List<Page> get pages => throw UnimplementedError();

  @override
  // TODO: implement reportsRouteUpdateToEngine
  bool get reportsRouteUpdateToEngine => throw UnimplementedError();

  @override
  // TODO: implement requestFocus
  bool get requestFocus => throw UnimplementedError();

  @override
  // TODO: implement restorationScopeId
  String? get restorationScopeId => throw UnimplementedError();

  @override
  // TODO: implement routeTraversalEdgeBehavior
  TraversalEdgeBehavior get routeTraversalEdgeBehavior => throw UnimplementedError();

  @override
  DiagnosticsNode toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) {
    // TODO: implement toDiagnosticsNode
    throw UnimplementedError();
  }

  @override
  String toStringDeep({String prefixLineOne = '', String? prefixOtherLines, DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringDeep
    throw UnimplementedError();
  }

  @override
  String toStringShallow({String joiner = ', ', DiagnosticLevel minLevel = DiagnosticLevel.debug}) {
    // TODO: implement toStringShallow
    throw UnimplementedError();
  }

  @override
  String toStringShort() {
    // TODO: implement toStringShort
    throw UnimplementedError();
  }

  @override
  // TODO: implement transitionDelegate
  TransitionDelegate get transitionDelegate => throw UnimplementedError();
}
