// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/getx_count_controller.dart';

class GetXCounterPage extends StatelessWidget {
  const GetXCounterPage({Key? key}) : super(key: key);
  //GetxCountController con = Get.put(GetxCountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<GetxCountController>(
              init: GetxCountController(),
              builder: (controller) {
                return Text(
                  'Current Counter is ${controller.count}',
                  style: const TextStyle(fontSize: 25),
                );
              },
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Get.find<GetxCountController>().increment();
                // con.increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
