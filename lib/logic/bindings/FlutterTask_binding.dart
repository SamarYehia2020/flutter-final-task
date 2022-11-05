import 'package:flutter_task/logic/controllers/FlutterTask_controller.dart';
import 'package:flutter_task/logic/controllers/cart_controller.dart';
import 'package:get/get.dart';

class FlutterTaskControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FlutterTaskController());
  }
}
