import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/second_controller.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SecondController>(
      init: SecondController(),
      builder:
          (controller) => Scaffold(
            appBar: AppBar(title: const Text('Second Page')),
            body: Column(
              children: [
                Image.network(controller.studentDetils.image),
                Text('Name: ${controller.studentDetils.name}'),
                Text('Age: ${controller.studentDetils.age}'),
                Text('ID: ${controller.studentDetils.id}'),
              ],
            ),
          ),
    );
  }
}
