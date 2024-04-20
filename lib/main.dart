import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:socialrate/apps_constants.dart';
import 'package:socialrate/components/BottomBarView/bottom_view_model.dart';
import 'package:socialrate/views/LoginView/login_view_model.dart';
import 'package:socialrate/views/MainView/main_view.dart';
import 'views/LoginView/login_view.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BottombarViewModel bottomBarController = Get.put(BottombarViewModel());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      home: _getRoute(),
    );
  }

  Widget _getRoute() {
    final token = box.read(TokenType.access.toString());
    return token == null ? const LoginView() : const MainView();
  }
}
