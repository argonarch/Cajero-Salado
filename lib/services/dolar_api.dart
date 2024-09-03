import 'package:http/http.dart' as http;
import 'dart:convert';

class DolarApi {
  static double dolarToday = 0;
  Future<double> getDolar() async {
    String linkDolar = 'http://escuderokevin.com.ar:7070/api/dolarblue';
    var responseDolar = await http.get(Uri.parse(linkDolar));
    var data = jsonDecode(responseDolar.body);
    var rest = data["venta"];
    dolarToday = double.parse(rest);
    return dolarToday;
  }

  static double convertToDolars(double pesos) {
    return pesos * dolarToday;
  }
}
