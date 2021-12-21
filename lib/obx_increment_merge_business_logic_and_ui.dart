// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// ignore: must_be_immutable
class ObxIncrementInMergeBusinessLogicAndUI extends StatelessWidget {
  var count = 0.obs;
  void increment() {
    count++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                "Count value is $count",
                style: const TextStyle(fontSize: 25),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                increment();
              },
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
