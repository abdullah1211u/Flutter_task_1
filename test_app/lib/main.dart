import 'package:flutter/material.dart';
import 'package:test_app/Second_Page.dart';
import 'package:test_app/first.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 65, 170, 191),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Home Page'),
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
        leading: Icon(Icons.line_weight_outlined),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) => firstPage())),
              );
            },
            icon: Icon(Icons.settings),
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                (MaterialPageRoute(builder: (context) => SecondPage())),
              );
            },
            icon: Icon(Icons.info),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Hello flutter',
              style: TextStyle(
                color: const Color.fromARGB(255, 113, 7, 7),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 30, right: 40),
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 216, 108, 124),
          borderRadius: BorderRadius.circular(30),
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
