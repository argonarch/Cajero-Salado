import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../components/autenticacion.dart' as auth;
import '../pages/productos.dart';
import '../pages/ajustes.dart';
import '../pages/facturas.dart';
import '../pages/ganancias.dart';
import '../assets/variables.dart' as global;

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
    DateTime dateToday = DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    print(date); // 2021-06-24
    if (date != GetStorage().read("date_now")) {
      auth.getRefreshToken().then((token) {
        auth.getDropboxTemporaryLink(token, global.filePath).then((link) {
          print('Temporary link: $link');
          auth.getItems(link).then((jsonlistItems) {
            auth.convertJsonToWidgetData(jsonlistItems).then((listItems) {
              global.widgetDataList = listItems;
              GetStorage().write('list_Items', listItems);
            });
            }
          );
          auth.getDolar().then((dolarToday) {
            global.priceDolar = dolarToday;
            GetStorage().write('price_Dolares', dolarToday);
            print("Dolar Today: $dolarToday.toString()");
          });
          GetStorage().write("date_now", date);
        }).catchError((error) {
          print('Error: $error');
        });
      }).catchError((error) {
        print('Error: $error');
      });
    } else {
      auth.convertJsonToWidgetData(GetStorage().read('list_Items')).then((listItems) {
        global.widgetDataList = listItems;
      });
      global.priceDolar = GetStorage().read('price_Dolares');

    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      PageFacturas(),
      PageProductos(),
      PageGanancias(),
      PageAjustes()
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

