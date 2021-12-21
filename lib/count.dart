// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/count_controller.dart';

class Counter extends StatelessWidget {
  Counter({Key? key}) : super(key: key);

  CountController con = Get.put(CountController());
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
                "Counter is now ${con.count}",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                con.counter();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
