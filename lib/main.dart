import 'package:flutter/material.dart';
import 'package:flutter_task/routes/route.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      getPages: AppRoutes.routes,
    );
  }
}
