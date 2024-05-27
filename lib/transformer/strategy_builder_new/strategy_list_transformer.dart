import 'package:state_router/transformer/strategy_builder_new/strategy.dart';

import 'list_transformer_new.dart';

class StrategyListTransformer<S> implements ListTransformer<S> {
  bool Function(S a, S b) findStrategy;

  StrategyListTransformer(
      {this.sourceList = const [],
      this.mapRule = const [],
      required bool Function(dynamic a, dynamic b) this.findStrategy}) {
    _init();
  }

  final List<TransformRule<S>>? mapRule;

  Map<Type, Strategy<S>>? _strategyMap;

  //App State
  final List<S> sourceList;

  //Route State
  List<S> _resultList = [];

  void _init() {
    if (_strategyMap == null) {
      _strategyMap = {};
      for (var element in mapRule!) {
        _strategyMap![element.type] = element.strategy;
      }
    }
  }

  List<S> push(S value) {
    print("+${value.runtimeType}");
    final S? resObj = value;

    final strategy = _strategyMap?[value.runtimeType];
    //List<R> result = [];
    if (strategy != null && resObj != null) {
      final result = strategy.routeBuilder(routes: _resultList, route: resObj);
      _resultList = result;
    }
    notifyListeners();
    return _resultList;
  }

  @override
  List<S> pop() {
    _resultList.removeLast();
    notifyListeners();
    return _resultList;
  }

  @override
  List<S> get() {
    return _resultList;
  }

  final List<Function(List<S>)> _stackListener = [];

  void addStackLister(Function(List<S>) listener) {
    _stackListener.add(listener);
  }

  void notifyListeners() {
    for (var element in _stackListener) {
      element(_resultList);
    }
  }
}

class TransformRule<S> {
  bool Function(S a, S b) onCompare;

  TransformRule(
      {required this.type, required this.strategy, required this.onCompare});

  final Type type;
  final Strategy<S> strategy;
}
