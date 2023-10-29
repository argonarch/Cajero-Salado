import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

class PageAjustes extends StatefulWidget{
  const PageAjustes({super.key});
  @override
  State<PageAjustes> createState() => _PageAjustesState();
}

class _PageAjustesState extends State<PageAjustes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAjustes(),
      body: SettingsList(
        platform: DevicePlatform.android,
        sections: [
          SettingsSection(
            tiles: [
              SettingsTile(
                title: Text('Tema'),
                leading: Icon(Icons.wifi),
              ),
              SettingsTile(
                title: Text('Ganancias'),
                description: Text('Primer Dia, Bla'),
                leading: Icon(Icons.devices_other),
              ),
              SettingsTile(
                title: Text('Facturas'),
                description: Text('Bla, Bla'),
                leading: Icon(Icons.devices_other),
              ),
              SettingsTile(
                title: Text('Productos'),
                description: Text('Bla, Bla'),
                leading: Icon(Icons.devices_other),
              ),
              SettingsTile(
                title: Text('Backups'),
                description: Text('Bla, Bla'),
                leading: Icon(Icons.devices_other),
              ),
            ],
          ),
        ],
      ),
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
