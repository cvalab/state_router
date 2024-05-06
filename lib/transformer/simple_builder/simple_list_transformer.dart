
import '../list_transformer.dart';

class SimpleListTransformer<S, R> implements ListTransformer<S, R> {
  List<R> Function(List<R> routes, S route) builder;

  SimpleListTransformer({required this.builder});

  List<R> _resultList = [];

  @override
  List<R> get() {
    return _resultList;
  }

  @override
  List<R> push(S value) {
    _resultList = builder(_resultList, value);
    return _resultList;
  }

  @override
  List<R> pop() {
    _resultList.removeLast();
    return _resultList;
  }
}
