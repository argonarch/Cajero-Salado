import 'package:flutter/material.dart';

class PageAjustes extends StatefulWidget{
  const PageAjustes({super.key});
  @override
  State<PageAjustes> createState() => _PageAjustesState();
}

class _PageAjustesState extends State<PageAjustes>{

  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        appBarAjustes(),
        Text('data'),
      ],
    );
  }
}

AppBar appBarAjustes(){
  return AppBar(
    title: const Text('Ajustes'),
    actions: <Widget>[
      IconButton(
        icon: const Icon(IconData(0xe567, fontFamily: 'MaterialIcons')),
        tooltip: 'Buscador',
        onPressed: () {},
      ),
    ],
  );
}
