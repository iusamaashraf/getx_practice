import 'package:get/get.dart';
import 'package:getx_practice/student.dart';

class MyController extends GetxController {
  // var student = Student();
  // void convertToUpperCase() {
  //   student.name.value = student.name.value.toUpperCase();
  // }
  var student = Student(age: 25, name: 'arif').obs;
  void convertToUpperCase() {
    student.update((student) {
      student!.name = student.name.toString().toUpperCase();
    });
  }
}
