import 'package:flutter/material.dart';
import '../assets/variables.dart' as global;
import '../views/view_select_product.dart' as product;
import '../views/view_add_product.dart' as product;

class PageProductos extends StatefulWidget {
  const PageProductos({super.key});
  @override
  State<PageProductos> createState() => _PageProductosState();
}

class _PageProductosState extends State<PageProductos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [appBarProductos(), Expanded(child: bodyProductos())],
    );
  }

  AppBar appBarProductos() {
    void navigateToAddProduct(BuildContext context) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => product.ViewAddProduct()));
    }

    return AppBar(
      title: const Text('Productos'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.sync_outlined),
          tooltip: 'Sincronizar',
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Agregar',
          onPressed: () {
            navigateToAddProduct(context);
          },
        ),
        IconButton(
          icon: const Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
          tooltip: 'Buscar',
          onPressed: () {},
        ),
      ],
    );
  }
}

Widget bodyProductos() {
  void navigateToSelectProduct(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => product.ViewSelectProduct()));
  }

  return GridView.builder(
    itemCount: global.widgetDataList.length,
    padding: const EdgeInsets.only(top: 15, left: 12, right: 12),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 2.4,
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
    ),
    itemBuilder: (context, index) {
      return Center(
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.blue,
          title: Text(
            global.widgetDataList[index].name,
            textAlign: TextAlign.center,
          ),
          subtitle: Text(
            calculadorPrecioFinal(global.widgetDataList[index].precio,
                global.widgetDataList[index].beneficio),
            textAlign: TextAlign.center,
          ),
          onTap: () {
            global.nameItem = global.widgetDataList[index].name;
            global.priceItem = global.widgetDataList[index].precio;
            global.cantidadBeneficio = 0;
            global.pricePesos =
                global.widgetDataList[index].precio * global.priceDolar;
            global.cantidadItems = 0;
            global.beneficioItem = global.widgetDataList[index].beneficio;
            navigateToSelectProduct(context);
          },
        ),
      );
    },
  );
}

calculadorPrecioFinal(precio, beneficio) {
  double precioFinal = precio * global.priceDolar;
  return precioFinal.round().toString();
}
