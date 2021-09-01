import 'package:flutter/material.dart';

// This example presented for Adv Mob Apps Course in TIU University at 1 Sept 2021
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// ColorSwatch here acting like a table of colors that you can use to store many of your colors
const _colorSwatch = ColorSwatch(0xFF0000CC, {
  1: Color(0xFFCE6C37),
  2: Color(0xffe82ddf),
  3: Color(0xff7f8b43),
});

class _MyHomePageState extends State<MyHomePage> {
  // _counter variable is a state of the MyHomePage widget which means it could be updated during user interaction
  int _counter = 0;
//This function below responsible for updating the counter value during user interaction using setState function to redraw the widget on the device screen
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Content  inside OrientationBuilder will be update according to the device status (landscape or portrait)
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            if (orientation == Orientation.portrait) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      _counter = 0;
                    }),
                    onLongPress: () => print("Long Press"),
                    onDoubleTap: () => print("Double Tap"),
                    onVerticalDragStart: (h) => print("$h drag"),
                    child: Text('T',
                        style: TextStyle(color: _colorSwatch[1], fontSize: 25)),
                  ),
                  Text('I',
                      style: TextStyle(color: _colorSwatch[2], fontSize: 25)),
                  Text('U',
                      style: TextStyle(color: _colorSwatch[3], fontSize: 25)),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            } else {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      _counter = 0;
                    }),
                    onLongPress: () => print("Long Press"),
                    onDoubleTap: () => print("Double Tap"),
                    onVerticalDragStart: (h) => print("$h drag"),
                    child: Text('T',
                        style: TextStyle(color: _colorSwatch[1], fontSize: 25)),
                  ),
                  Text('I',
                      style: TextStyle(color: _colorSwatch[2], fontSize: 25)),
                  Text('U',
                      style: TextStyle(color: _colorSwatch[3], fontSize: 25)),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
