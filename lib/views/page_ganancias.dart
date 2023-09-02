import 'package:flutter/material.dart';

class PageGanancias extends StatefulWidget {
  const PageGanancias({super.key});
  @override
  State<PageGanancias> createState() => _PageGananciasState();
}

class _PageGananciasState extends State<PageGanancias> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Column(
        children: [
          appBarGanancias(),
          TabBar(
            tabs: <Widget>[
              Tab(text: 'Diario'),
              Tab(text: 'Semanal'),
              Tab(text: 'Mensual'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: <Widget>[
                Center(
                  child: Text("It's cloudy here"),
                ),
                Center(
                  child: Text("It's rainy here"),
                ),
                Center(
                  child: Text("It's sunny here"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarGanancias() {
    return AppBar(
      title: const Text('Ganancias'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
          tooltip: 'Buscador',
          onPressed: () {},
        ),
      ],
    );
  }
}

void handleClick(int item) {
  switch (item) {
    case 0:
      break;
    case 1:
      break;
    case 2:
      break;
  }
}
