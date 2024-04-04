import 'package:state_router/strategy_builder/strategy.dart';

class Example{

  void stackNavigator(){

    Map<Type, Strategy> strategyMap = {
      Standard: const Standard(),
      SingleTop: const SingleTop(),
      SingleTask: const SingleTask(),
      SingleInstance: const SingleInstance(),
    };


}}