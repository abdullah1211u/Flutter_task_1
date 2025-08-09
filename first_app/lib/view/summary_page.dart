import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String userName;
  final int age;

  // Constructor to receive the user name and age.
  const SummaryPage({super.key, required this.userName, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Summary',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 233, 96, 5),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Displaying the user's name received from the previous page.
              Text(
                'User Name: $userName',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),

              // Displaying the age received from the previous page.
              Text(
                'Current Age: $age',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),

              // Displaying a local image.
              Image.asset(
                'assets/images/profile.png',
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, size: 50, color: Colors.red);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
