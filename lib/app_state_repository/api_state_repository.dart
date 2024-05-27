import 'dart:async';

import 'app_state.dart';



class AppStateRepository {
  static final AppStateRepository _singleton = AppStateRepository._internal();

  AppStateRepository._internal();

  factory AppStateRepository() {
    return _singleton;
  }

  StreamController<AppStateSt> appStateStream = StreamController.broadcast();

  Stream<AppStateSt> get appStateStreamSt => appStateStream.stream;

  void updateAppState(AppStateSt appState) {
    print('updateAppState=> $appState');
    appStateStream.add(appState);
  }
}
