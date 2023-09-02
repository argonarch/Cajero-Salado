import 'package:flutter/material.dart';
import '../assets/variables.dart' as global;

class PageFactura extends StatefulWidget {
  const PageFactura({super.key});
  @override
  State<PageFactura> createState() => _PageFacturaState();
}

class _PageFacturaState extends State<PageFactura> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: const Text('Factura'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
              tooltip: 'Buscador',
              onPressed: () {},
            ),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView.builder(
            itemCount: global.strings.length,
            itemBuilder: (context, index) => global.strings[index],
          ),
        ))
      ],
    );
  }
}
