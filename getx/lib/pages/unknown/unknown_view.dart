import 'package:flutter/material.dart';


class UnknownScreen extends StatelessWidget {
  const UnknownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}
