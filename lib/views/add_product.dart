import 'package:flutter/material.dart';
import '../assets/variables.dart' as global;
import '../components/widget_data.dart';

class ViewAddProduct extends StatefulWidget {
  @override
  State<ViewAddProduct> createState() => _ViewAddProductState();
}

class _ViewAddProductState extends State<ViewAddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController benefitController = TextEditingController();
  late int idNext;
  late WidgetData itemAgregado;
  late double priceDouble;
  late double benefitDouble;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    priceController.dispose();
    benefitController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Creando Producto")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: priceController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Precio Unitario',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: benefitController,
                  obscureText: false,
                  decoration: InputDecoration(
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
            child: Icon(Icons.delete),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.add_circle_outline_rounded),
            onPressed: () => {
              idNext = global.widgetDataList.last.id,
              priceDouble = double.parse(priceController.text),
              benefitDouble = double.parse(benefitController.text),
              itemAgregado = WidgetData(id: idNext, name: nameController.text, precio: priceDouble, beneficio: benefitDouble),
              global.widgetDataList.add(itemAgregado)
            },
          ),
        ]));
  }
}
