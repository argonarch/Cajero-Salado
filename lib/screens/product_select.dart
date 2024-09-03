import 'package:flutter/material.dart';
import 'package:cajero_salado/models/product.dart';
import 'package:cajero_salado/services/dolar_api.dart';

class ScreenSelectProduct extends StatefulWidget {
  final Product product;
  const ScreenSelectProduct({super.key, required this.product});
  @override
  State<ScreenSelectProduct> createState() => _ScreenSelectProductState();
}

class _ScreenSelectProductState extends State<ScreenSelectProduct> {
  @override
  void initState() {
    super.initState();
  }

  int quantity = 0;
  int profitIndexed = 0;
  final List<double> values = [1.0, 2.0, 3.0, 6.0, 12.0, 24.00];
  final List<bool> _selectedFruits = <bool>[
    true,
    false,
    false,
    false,
    false,
    false
  ];
  final List<Widget> cantidades = <Widget>[
    const Text("1"),
    const Text("2"),
    const Text("3"),
    const Text("6"),
    const Text("12"),
    const Text("24")
  ];
  final List<bool> _selectedCantidades = <bool>[
    true,
    false,
    false,
    false,
    false,
    false
  ];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> strings = [];
    return Scaffold(
        appBar: AppBar(title: Text(widget.product.name)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Dolar Blue hoy: \$${DolarApi.dolarToday.toString()}',
                  style: const TextStyle(fontSize: 27.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "Valor Producto: \$${precioFinal(widget.product.price.toString())}",
                  style: const TextStyle(fontSize: 27.0),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 22),
                child: Text(
                  "Porcentaje de Beneficio",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  spacing: _buttonWidth(context) - 26,
                  children: const [
                    Text("0%"),
                    Text("10%"),
                    Text("15%"),
                    Text("20%"),
                    Text("25%"),
                    Text("30%"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedFruits.length; i++) {
                        _selectedFruits[i] = i == index;
                      }
                      profitIndexed = index;
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: BoxConstraints(
                    minHeight: 50.0,
                    minWidth: _buttonWidth(context),
                  ),
                  isSelected: _selectedFruits,
                  children: <Widget>[
                    Text("${porcetajeador(0, quantity)}"),
                    Text("\$${porcetajeador(10, quantity)}"),
                    Text("\$${porcetajeador(15, quantity)}"),
                    Text("\$${porcetajeador(20, quantity)}"),
                    Text("\$${porcetajeador(25, quantity)}"),
                    Text("\$${porcetajeador(30, quantity)}"),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "Cantidad de Producto",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ToggleButtons(
                  direction: vertical ? Axis.vertical : Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedCantidades.length; i++) {
                        _selectedCantidades[i] = i == index;
                      }
                      quantity = index;
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Colors.red[700],
                  selectedColor: Colors.white,
                  fillColor: Colors.red[200],
                  color: Colors.red[400],
                  constraints: BoxConstraints(
                    minHeight: 50.0,
                    minWidth: _buttonWidth(context),
                  ),
                  isSelected: _selectedCantidades,
                  children: cantidades,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.close_rounded),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.save_as),
            onPressed: () => {
              strings.add(Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Column(
                  children: [
                    Text(
                        "Nombre: ${widget.product.name}, Cantidad: ${quantity.toString()}"),
                    Text(
                        "Beneficio: ${saberBeneficio()}%, Total: \$${precioFinal(widget.product.price)}")
                  ],
                ),
              ))
            },
          ),
        ]));
  }

  porcetajeador(double beneficio, int items) {
    final List<double> values = [1.0, 2.0, 3.0, 6.0, 12.0, 24.00];
    double precioPorcentual =
        widget.product.priceWithProfit() * values[items] / 100;
    return precioPorcentual.round().toString();
  }

  precioFinal(precio) {
    final List<double> values = [1.0, 2.0, 3.0, 6.0, 12.0, 24.00];
    final List<double> porcentajes = [0.00, 10.0, 15.0, 20.0, 25.0, 30.0];
    double precioFinal = DolarApi.convertToDolars(precio) *
        values[quantity] *
        (1 + porcentajes[profitIndexed] / 100);
    return precioFinal.round().toString();
  }

  saberBeneficio() {
    final List<double> porcentajes = [0.00, 10.0, 15.0, 20.0, 25.0, 30.0];
    return porcentajes[profitIndexed].round().toString();
  }
}

double _buttonWidth(BuildContext context) {
  const maxWidth = 120.0;
  const buttonCount = 6;

  final width = (MediaQuery.of(context).size.width - 50) / buttonCount;
  if (width < maxWidth) {
    return width;
  } else {
    return maxWidth;
  }
}
