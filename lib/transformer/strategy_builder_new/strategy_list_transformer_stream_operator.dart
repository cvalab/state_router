import 'dart:async';

import 'package:state_router/transformer/strategy_builder/strategy_list_transformer.dart';


class StrategyListTransformer<S, R> extends StreamTransformerBase<S, R> {
  final List<MapRule<S, R>> mapRule;

  StrategyListTransformer({required this.mapRule});

  @override
  Stream<R> bind(Stream<S> stream) {
    return stream.map((state) {
      for (var rule in mapRule) {
        if (state.runtimeType == rule.type) {
          return rule.mapFunction!(state);
        }
      }
      throw Exception('No matching rule found for state type ${state.runtimeType}');
    });
  }
}