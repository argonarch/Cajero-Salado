import 'package:flutter/material.dart';
import 'package:cajero_salado/models/product.dart';
import 'package:cajero_salado/screens/product_add.dart' as product;
import 'package:cajero_salado/screens/product_select.dart' as product;

class PageProductos extends StatefulWidget {
  final List<Product> products;

  const PageProductos({super.key, required this.products});

  @override
  State<PageProductos> createState() => _PageProductosState();
}

class _PageProductosState extends State<PageProductos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarProductos(), body: bodyProductos());
  }

  AppBar appBarProductos() {
    void navigateToAddProduct(BuildContext context) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const product.ViewAddProduct()));
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

  Widget bodyProductos() {
    void navigateToSelectProduct(
        BuildContext context, Product productSelected) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              product.ScreenSelectProduct(product: productSelected)));
    }

    return GridView.builder(
      itemCount: widget.products.length,
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
              widget.products[index].name,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(
              widget.products[index].priceWithProfit().toString(),
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Product productSelected = widget.products[index];
              navigateToSelectProduct(context, productSelected);
            },
          ),
        );
      },
    );
  }
}
