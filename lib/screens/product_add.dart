import 'package:flutter/material.dart';
import 'package:cajero_salado/services/isar_db.dart';

class ViewAddProduct extends StatefulWidget {
  const ViewAddProduct({super.key});
  @override
  State<ViewAddProduct> createState() => _ViewAddProductState();
}

class _ViewAddProductState extends State<ViewAddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController profitController = TextEditingController();

  late String name;
  late double price;
  late double profit;

  @override
  void dispose() {
    super.dispose();
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    profitController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Creando Producto")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: priceController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Precio Unitario',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: profitController,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Beneficio Esperado',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.delete),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () => {
              name = nameController.text,
              price = double.parse(priceController.text),
              profit = double.parse(profitController.text),
              saveProduct(name, price, profit),
            },
          ),
        ]));
  }
}
