import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:cajero_salado/screens/main.dart';
import 'package:cajero_salado/variables.dart' as global;
import 'package:cajero_salado/services/dropbox_api.dart';

Logger logger = Logger();

void main() async {
  runApp(const MyApp());
  global.products = await DropboxApi().getProducts();
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
        home: const MainScreen());
  }
}
