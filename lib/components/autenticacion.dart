import 'dart:convert';
import 'package:http/http.dart' as http;
import 'widget_data.dart';

Future<List<dynamic>> getItems(String link) async {
  var response = await http.get(Uri.parse(link));
  String respuesta = response.body;
  List<dynamic> jsonList = jsonDecode(respuesta);
  print("json es: $jsonList");
  return jsonList;
}

Future<List<WidgetData>> convertJsonToWidgetData(List<dynamic> jsonWithItems) async {
  List<WidgetData> data = jsonWithItems.map((json) => WidgetData.fromJson(json)).toList();
  return data;
}

Future<double> getDolar() async{
  String linkDolar = 'http://escuderokevin.com.ar:7070/api/dolarblue';
  var responseDolar = await http.get(Uri.parse(linkDolar));
  var data = jsonDecode(responseDolar.body);
  var rest = data["venta"];
  double dolarToday = double.parse(rest);
  return dolarToday; 
}

Future<String> getRefreshToken() async {
  final data = {
    'grant_type': 'refresh_token',
    'refresh_token':
        '3XwTzrnwikQAAAAAAAAAAeolGsb2SDZXIg0gCYegTy20n3d5ejZV33qzjwVrS5OX',
    'client_id': 'ahniktwmll3437t',
    'client_secret': 'hiuqdmt057yuadv',
  };
  final url = Uri.parse('https://api.dropbox.com/oauth2/token');
  final response = await http.post(url, body: data);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final accessToken = jsonResponse['access_token'];
    return accessToken;
  } else {
    throw Exception('Failed to get temporary link. Error: ${response.body}');
  }
}

Future<String> getDropboxTemporaryLink(
    String accessToken, String filePath) async {
  final url =
      Uri.parse('https://api.dropboxapi.com/2/files/get_temporary_link');

  final headers = {
    'Authorization': 'Bearer $accessToken',
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'path': filePath,
  });

  final response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    final temporaryLink = jsonResponse['link'];
    return temporaryLink;
  } else {
    throw Exception('Failed to get temporary link. Error: ${response.body}');
  }
}

