import 'package:flutter_task/logic/bindings/FlutterTask_binding.dart';
import 'package:flutter_task/logic/bindings/cart_binding.dart';
import 'package:flutter_task/view/screens/cart.dart';
import 'package:flutter_task/view/screens/home.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const homeScreen = "/HomeScreen";
  static final routes = [
    GetPage(
      name: "/HomeScreen",
      page: () => HomeScreen(),
      binding: FlutterTaskControllerBinding(),
    ),
    GetPage(
      name: "/CartScreen",
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
  ];
}
