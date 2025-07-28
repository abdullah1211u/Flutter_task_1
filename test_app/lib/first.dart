import 'package:flutter/material.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
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
            color: const Color.fromARGB(255, 51, 151, 209),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color.fromARGB(255, 210, 185, 22)),
          ),
          child: Center(
            child: Text(
              'StateFulWidget',
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
