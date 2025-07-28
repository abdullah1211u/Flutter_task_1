import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to MainPage
          },
        ),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 169, 133, 201),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 243, 33, 240)),
          ),
          child: Center(
            child: Text(
              'StateLessWidget',
              style: TextStyle(
                color: const Color.fromARGB(255, 3, 2, 7),
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
    );
  }
}
