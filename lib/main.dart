import 'package:adder/adder.dart';
import 'package:randomizer/randomizer.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Adder.instance.ensureInitialized();
  Randomizer.instance.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const Adder _adder = Adder.instance;
  static const Randomizer _randomizer = Randomizer.instance;

  int _counter = 0;
  int _random = 0;

  void _getValues() {
    setState(() {
      _counter = _adder.add(_counter, 1);
      _random = _randomizer.random();
    });
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              'Random value:',
            ),
            Text(
              '$_random',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getValues,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
