import 'package:flutter/material.dart';
import 'package:cajero_salado/views/bills.dart';
import 'package:cajero_salado/views/profits.dart';
import 'package:cajero_salado/views/settings.dart';
import 'package:cajero_salado/views/products.dart';
import 'package:cajero_salado/variables.dart' as global;
import 'package:logger/logger.dart';

Logger logger = Logger();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const PageFacturas(),
      PageProductos(products: global.products),
      const PageGanancias(),
      const PageAjustes()
    ];
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.book_rounded),
            label: 'Factura',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart),
            label: 'Productos',
          ),
          NavigationDestination(
            icon: Icon(Icons.monetization_on),
            label: 'Ganancias',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
