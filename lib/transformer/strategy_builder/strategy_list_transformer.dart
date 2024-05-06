

import 'package:state_router/transformer/strategy_builder/strategy.dart';

import '../list_transformer.dart';

class StrategyListTransformer<S, R> implements ListTransformer<S, R> {
  StrategyListTransformer(
      {this.sourceList = const [], this.mapRule = const []}) {
    _init();
  }

  final List<MapRule<S, R>>? mapRule;

  Map<Type, R Function(S)>? objectMaper;

  //Map<Type, Object Function(Object)>? objectMaper;

  Map<Type, Strategy<R>>? _strategyMap;

  //App State
  final List<S> sourceList;

  //Route State
  List<R> _resultList = [];

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

  List<R> push(S value) {
    print("+${value.runtimeType}");
    final R Function(S)? mapFunction = objectMaper?[value.runtimeType];
    final R? resObj = mapFunction != null ? mapFunction(value) : null;

    final strategy = _strategyMap?[value.runtimeType];
    //List<R> result = [];
    if (strategy != null && resObj != null) {
      final result = strategy.routeBuilder(routes: _resultList, route: resObj);
      _resultList = result;
    }
    notifyListeners();
    return _resultList;
  }

  List<R> pop() {
    _resultList.removeLast();
    notifyListeners();
    return _resultList;
  }

  List<R> get() {
    return _resultList;
  }

  final List<Function(List<R>)> _stackListener = [];

  void addStackLister(Function(List<R>) listener) {
    _stackListener.add(listener);
  }

  void notifyListeners() {
    for (var element in _stackListener) {
      element(_resultList);
    }
  }
}

class MapRule<S, R> {
  MapRule( {required this.name,required this.type, required this.strategy, this.mapFunction});

  final String name ;
  final Type type;
  final Strategy<R> strategy;
  final R Function(S)? mapFunction;
}
