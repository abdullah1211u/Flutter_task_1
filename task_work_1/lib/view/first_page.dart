import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:task_work_1/controller/firstpage_controller.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstPageController>(
      init: FirstPageController(),
      builder: (FirstPageController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'First Page',
              style: TextStyle(color: Color.fromARGB(255, 211, 11, 11)),
            ),
          ),

          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to the First Page!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 212, 82, 12),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Counter value: ${controller.counter}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(137, 5, 33, 174),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      width: 100,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Image.asset('assets/images/logo2.png', width: 200, height: 200),
                Image.network(
                  'https://beecrowd.com/wp-content/uploads/2024/04/2022-06-23-Flutter.jpg',
                  width: 200,
                  height: 200,
                ),
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.counter++;
              controller.update(); // Notify the UI to update
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
