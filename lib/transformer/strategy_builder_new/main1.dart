import 'package:state_router/transformer/strategy_builder_new/strategy.dart';
import 'package:state_router/transformer/strategy_builder_new/strategy_list_transformer.dart';

import '../../states/app_states.dart';

void main() {
  StrategyListTransformer<AppState> strategyListTransformer =
      StrategyListTransformer(
          mapRule: [
        TransformRule(
            type: HomeState,
            strategy: const Standard(),
            onCompare: (a, b) {
              if (identical(a, b)) {
                return true;
              }
              return false;
            }
            //name: 'Home',
            ),
        TransformRule(
            type: AboutState,
            strategy: const SingleTask(),
            onCompare: (a, b) {
              if (identical(a, b)) {
                return true;
              }
              return false;
            } //name: 'About',
            )
      ],
          findStrategy: (a, b) {
            return (identical(a, b));
          });

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
