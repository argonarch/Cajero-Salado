import 'package:flutter/material.dart';

class PageFacturas extends StatefulWidget {
  const PageFacturas({super.key});

  @override
  State<PageFacturas> createState() => _PageFacturasState();
}

class _PageFacturasState extends State<PageFacturas> {
  @override
  Widget build(BuildContext context) {
    List<Widget> strings = [];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Factura'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
              tooltip: 'Buscador',
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView.builder(
            itemCount: strings.length,
            itemBuilder: (context, index) => strings[index],
          ),
        ));
  }
}
