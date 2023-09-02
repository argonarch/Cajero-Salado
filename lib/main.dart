import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/main_screen.dart';

void main() async {
  await GetStorage.init();
  //GetStorage().erase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Cajero Salado",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        useMaterial3: true,
      ),
        home: MainScreen());
  }
}
