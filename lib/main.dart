import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_router/pages/about_page.dart';
import 'package:state_router/pages/splash_screen.dart';

import 'app_state_repository/api_state_repository.dart';
import 'app_state_repository/app_state.dart';
import 'observer/avigation_history_observer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  List<Page> pages = [
    const MaterialPage(
        key: ValueKey('splash12'), child: SplashScreen(), name: 'splash12')
  ];

  final navigationHistoryObserver = NavigationHistoryObserver();

  @override
  void initState() {
    navigationHistoryObserver.historyChangeStream.listen((event) {
      if (kDebugMode) {
        String? name = (event as HistoryChange).newRoute?.settings.name;
        print('History changed name=> $name');
        print('History changed=> $event');
        print('pages=> ${pages.length}');
      }
    });

    pages = [
      ...pages,
      ...[
        const MaterialPage(
            key: ValueKey('home12'),
            name: 'home12',
            child: MyHomePage(title: 'Flutter Demo Home Page')),
      ],
    ];

    AppStateRepository().appStateStreamSt.listen((event) {
      print(' state event=> $event');
      if (event is AboutPageSt) {
        print(' state event2=> $event');

        pages.add(const MaterialPage(
            key: ValueKey('aboutPage12'),
            name: 'aboutPage12',
            child: AboutPage(title: 'title')));
        print(pages.length);

        setState(() {});
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Navigator(
          key: navigatorKey,
          pages: pages,
          observers: [navigationHistoryObserver],
          onPopPage: (route, result) {
            print(pages.length);

            final isDidPop = route.didPop(result);
            if (isDidPop) {
              pages.remove(route.settings);
              setState(() {});
            }
            print(pages.length);

            return isDidPop;
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    settings: const RouteSettings(name: "aboutPage12"),
                    builder: (BuildContext context) {
                      return const AboutPage(
                        title: 'title',
                      );
                    }),
              );
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const Divider(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {
              showDialog(
                  useRootNavigator: false,
                  routeSettings: const RouteSettings(name: "Dialog12"),
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Dialog Title'),
                        content: Column(
                          children: [
                            Text('This is my content'),
                            Divider(
                              height: 24,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      settings: const RouteSettings(
                                          name: "aboutPage12"),
                                      builder: (BuildContext context) {
                                        return const AboutPage(
                                          title: 'About Page',
                                        );
                                      }),
                                );
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        ),
                      ));
            },
            tooltip: 'Increment',
            child: const Icon(Icons.message),
          ),
          const Divider(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {
              AppStateRepository().updateAppState(AboutPageSt());

              /*        pages.add(const MaterialPage(
                  name: 'aboutPage12', child: AboutPage(title: 'title')));
            */
            },
            tooltip: 'Increment',
            child: const Icon(Icons.plus_one),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
