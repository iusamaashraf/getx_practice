// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/my_controller.dart';
// import 'package:getx_practice/student.dart';

class CustomClassGetData extends StatelessWidget {
  CustomClassGetData({Key? key}) : super(key: key);
  //this variable for whole class makes reactive
  //var student = Student(name: 'Billa', age: 33).obs;
  // this variable for one or more variables are reactive
  // var student = Student();
  // Now we use these things through the controller
  MyController controller = Get.put(MyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  'My name is ${controller.student.value.name}',
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                child: const Text('Upper Case'),
                onPressed: () {
                  // student.update((val) {
                  //   student.value.name =
                  //       student.value.name.toString().toUpperCase();
                  // });
                  // student.age.value = student.age.value.bitLength;
                  controller.convertToUpperCase();
                },
              ),
            ],
          ),
        ));
  }
}
