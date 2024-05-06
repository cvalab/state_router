import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:state_router/pages/about_page.dart';
import 'package:state_router/pages/splash_screen.dart';
import 'package:state_router/transformer/state_router.dart';

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

  final StateRouter router = StateRouter();

  List<Page> pages = [
    const MaterialPage(child: SplashScreen(), name: 'splash12')
  ];

  final Object state = Object();

  final navigationHistoryObserver = NavigationHistoryObserver();

  @override
  void initState() {
    navigationHistoryObserver.historyChangeStream.listen((event) {
      if (kDebugMode) {
        String? name = (event as HistoryChange).newRoute?.settings.name;
        print('History changed name=> $name');
        print('History changed=> $event');
      }
    });

    pages = [
      ...pages,
      ...[
        const MaterialPage(
            name: 'home12',
            child: MyHomePage(title: 'Flutter Demo Home Page')),
      ],
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Navigator(
          //key: navigatorKey,
          pages: pages,
          observers: [navigationHistoryObserver],
          onPopPage: (route, result) => route.didPop(result)),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
      floatingActionButton: FloatingActionButton(
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
