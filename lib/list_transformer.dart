import 'package:state_router/strategy_builder/strategy.dart';

class ListTransformer<K, T> {
  ListTransformer({this.sourceList = const [], this.mapRule = const []}){
    _init();
  }

  final List<MapRule>? mapRule;

  Map<Type, Object Function(Object)>? objectMaper;

  Map<Type, Strategy>? _strategyMap;

  //App State
  final List<Object> sourceList;

  //Route State
  final List<Object> _resultList = [];

  void _init() {
    if (_strategyMap == null) {
      _strategyMap = {};
      for (var element in mapRule!) {
        _strategyMap![element.type] = element.strategy;
      }
    }
    if (objectMaper == null) {
      objectMaper = {};
      for (var element in mapRule!) {
        objectMaper![element.type] = element.mapFunction!;
      }
    }
  }

  void push(Object value) {
    final strategy = _strategyMap?[value.runtimeType];
    if (strategy != null) {
      final result = strategy.routeBuilder(routes: _resultList, route: value);
      _resultList.addAll(result);
    }
  }

  void pop() {
    _resultList.removeLast();
  }

  List<Object> get() {
    return _resultList;
  }

  final List<Function(List<Object>)> _stackListener = [];

  void addStackLister(Function(List<Object>) listener) {
    _stackListener.add(listener);
  }

  void notifyListeners() {
    for (var element in _stackListener) {
      element(_resultList);
    }
  }
}

class MapRule {
  MapRule({required this.type, required this.strategy, this.mapFunction});

  final Type type;
  final Strategy strategy;
  final Object Function(Object)? mapFunction;
}
