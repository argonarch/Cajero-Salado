import 'package:flutter/material.dart';
import '../assets/variables.dart' as global;

class ViewSelectProduct extends StatefulWidget {
  @override
  State<ViewSelectProduct> createState() => _ViewSelectProductState();
}

class _ViewSelectProductState extends State<ViewSelectProduct> {
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
    Text("1"),
    Text("2"),
    Text("3"),
    Text("6"),
    Text("12"),
    Text("24")
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
    return Scaffold(
        appBar: AppBar(title: Text(global.nameItem)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Dolar Blue hoy: \$${global.priceDolar.round().toString()}',
                  style: TextStyle(fontSize: 27.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Text(
                  "Valor Producto: \$${precioFinal(global.priceItem)}",
                  style: TextStyle(fontSize: 27.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 22),
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
                  children: [
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
                      global.cantidadBeneficio = index;
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
                    Text("${porcetajeador(0, global.cantidadItems)}"),
                    Text("\$${porcetajeador(10, global.cantidadItems)}"),
                    Text("\$${porcetajeador(15, global.cantidadItems)}"),
                    Text("\$${porcetajeador(20, global.cantidadItems)}"),
                    Text("\$${porcetajeador(25, global.cantidadItems)}"),
                    Text("\$${porcetajeador(30, global.cantidadItems)}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
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
                      global.cantidadItems = index;
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
            child: Icon(Icons.close_rounded),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.save_as),
            onPressed: () => {global.strings.add(Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
            children: [
            Text(
            "Nombre: ${global.nameItem}, Cantidad: ${global.cantidadItems.toString()}"),
            Text(
            "Beneficio: ${saberBeneficio()}%, Total: \$${precioFinal(global.priceItem)}")
            ],
            ),
            ))},
          ),
        ]));
  }
}

porcetajeador(double beneficio, int items) {
  final List<double> values = [1.0, 2.0, 3.0, 6.0, 12.0, 24.00];
  double precioPorcentual = global.pricePesos * beneficio * values[items] / 100;
  return precioPorcentual.round().toString();
}

precioFinal(precio) {
  final List<double> values = [1.0, 2.0, 3.0, 6.0, 12.0, 24.00];
  final List<double> porcentajes = [0.00, 10.0, 15.0, 20.0, 25.0, 30.0];
  double precioFinal = precio *
      global.priceDolar *
      values[global.cantidadItems] *
      (1 + porcentajes[global.cantidadBeneficio] / 100);
  return precioFinal.round().toString();
}

saberBeneficio() {
  final List<double> porcentajes = [0.00, 10.0, 15.0, 20.0, 25.0, 30.0];
  return porcentajes[global.cantidadBeneficio].round().toString();
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
