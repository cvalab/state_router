import 'package:state_router/states/app_states.dart';
import 'package:state_router/states/result.dart';
import 'package:state_router/transformer/strategy_builder/strategy.dart';
import 'package:state_router/transformer/strategy_builder/strategy_list_transformer.dart';

void main() {
  StrategyListTransformer strategyListTransformer =
      StrategyListTransformer(mapRule: [
    MapRule(
      type: HomeState,
      strategy: const Standard(),
      mapFunction: (e) => HomeRoute(), name: 'Home',
    ),
    MapRule(
      type: AboutState,
      strategy: const SingleTask(),
      mapFunction: (e) => AboutRoute('About'), name: 'About',
    )
  ]);

  strategyListTransformer.addStackLister((p0) => print(p0));

  strategyListTransformer.get();

  strategyListTransformer.push(HomeState());

  strategyListTransformer.push(HomeState());

  strategyListTransformer.push(AboutState('H'));

  strategyListTransformer.push(AboutState('H'));

  strategyListTransformer.push(HomeState());

  strategyListTransformer.push(AboutState('Hi'));

  strategyListTransformer.push(AboutState('Hi'));
}
