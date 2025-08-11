import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/components/routes.dart';
import 'package:getx/controller/first_controller.dart';
import 'package:getx/model/fakedata.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FirstController>(
      init: FirstController(),
      builder:
          (controller) => Scaffold(
            appBar: AppBar(title: const Text('First Page')),
            body: ListView.builder(
              itemCount: FakeData.studentList.length,
              itemBuilder: (context, index) {
                final student = FakeData.studentList[index];
                return ListTile(
                  trailing: Icon(Icons.arrow_circle_right_outlined),

                  onTap: () {
                    Get.toNamed(Routes.secondScreen, arguments: student);
                  },

                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(student.image),
                      ),
                    ),
                  ),
                  title: Text(student.name),
                  subtitle: Text('Age: ${student.age}, ID: ${student.id}'),
                );
              },
            ),
          ),
    );
  }
}
