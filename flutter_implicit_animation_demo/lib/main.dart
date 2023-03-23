import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final int _counter = 0;
  double height = 200, width = 200;
  double turns = 0;
  double opacity = 0;
  final EdgeInsetsGeometry edgeInsets1 = const EdgeInsets.all(20);
  final EdgeInsetsGeometry edgeInsets2 = const EdgeInsets.all(60);
  late EdgeInsetsGeometry padding;
  BoxShape boxShape = BoxShape.rectangle;
  Color color = Colors.amber;
  CrossFadeState crossFadeState = CrossFadeState.showFirst;
  // late Widget switcherChild = const Text('Bahawalpur');

  void _incrementCounter() {
    setState(() {
      if (opacity == 0) {
        opacity = 1;
        color = Colors.red;
        turns = 1;
        width = 200;
        height = 200; // boxShape = BoxShape.rectangle;
      } else {
        opacity = 0;
        width = 200;
        height = 200;
        turns = 0;
        color = Colors.amber;
        // switcherChild = const Text('pakistan');
        // boxShape = BoxShape.circle;
      }
    });
    if (padding.hashCode == edgeInsets1.hashCode) {
      padding = edgeInsets2;
    } else {
      padding = edgeInsets1;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    padding = edgeInsets1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOutCubicEmphasized,
              opacity: opacity,
              child: const Text(
                'Click here:',
              ),
            ),
            AnimatedRotation(
              turns: turns,
              curve: Curves.easeInBack,
              duration: const Duration(seconds: 1),
              child: const Text('Pakistan'),
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.decelerate,
              width: width,
              height: height,
              decoration: BoxDecoration(color: color, shape: boxShape),
              child: AnimatedPadding(
                padding: padding,
                duration: const Duration(seconds: 1),
                child: Text(
                  'CAS',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            // AnimatedCrossFade(
            //     firstChild: IconButton(
            //         iconSize: 100,
            //         onPressed: () {
            //           setState(() {
            //             crossFadeState = CrossFadeState.showSecond;
            //           });
            //         },
            //         icon: const Icon(Icons.golf_course)),
            //     secondChild: IconButton(
            //         iconSize: 100,
            //         onPressed: () {
            //           setState(() {
            //             crossFadeState = CrossFadeState.showFirst;
            //           });
            //         },
            //         icon: const Icon(Icons.dangerous)),
            //     crossFadeState: crossFadeState,
            //     duration: const Duration(microseconds: 500))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
