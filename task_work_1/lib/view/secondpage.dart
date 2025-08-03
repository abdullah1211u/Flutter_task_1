import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Page',
          style: TextStyle(color: Color.fromARGB(255, 11, 211, 11)),
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Second Page!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 12, 82, 212),
          ),
        ),
      ),
    );
  }
}
