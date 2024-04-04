import 'package:state_router/state_router.dart';
import 'package:state_router/strategy_builder/strategy.dart';

class StackTransformer {
  List<Object> stack = [];

  Map<Type, Strategy> strategyMap = {
    Standard: const Standard(),
    SingleTop: const SingleTop(),
    SingleTask: const SingleTask(),
    SingleInstance: const SingleInstance(),
  };

  List<Object> push(Object route) {
    final strategy = strategyMap[route];
    stack = strategy!.routeBuilder(routes: stack, route: route);
    return stack;
  }

  void pop() {
    stack.removeLast();
  }
}
