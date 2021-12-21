// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/root_controller.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_practice/pages/first_page.dart';
import 'package:getx_practice/pages/second_page.dart';

class RootPage extends StatelessWidget {
  List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
  ];
  RootController con = Get.put(RootController());

  RootPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox.expand(
          child: Column(
            children: [
              tabs(),
              Obx(
                () => Expanded(
                  child: pages[con.selectedIndex.value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabs() {
    return Row(
      children: [
        tabsSelector(0, 'First Screen'),
        tabsSelector(1, 'Last Screen'),
      ],
    );
  }

  Widget tabsSelector(var index, String name) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            con.selectedIndex.value = index;

            // setState(() {
            //   selectedIndex = index;
            // });
          },
          child: Obx(
            () => Container(
                height: 40,
                width: 180,
                decoration: BoxDecoration(
                    color: index == con.selectedIndex.value
                        ? Colors.white
                        : Colors.black),
                child: Text(name,
                    style: TextStyle(
                        color: index == con.selectedIndex.value
                            ? Colors.black
                            : Colors.white))),
          ),
        )
      ],
    );
  }
}
