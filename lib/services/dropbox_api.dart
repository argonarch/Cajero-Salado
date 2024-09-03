import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:cajero_salado/models/product.dart';
import 'package:cajero_salado/variables.dart' as global;

class DropboxApi {
  Logger logger = Logger();

  Future<List<Product>> getProducts() async {
    String link =
        await getDropboxTemporaryLink(await getRefreshToken(), global.filePath);
    var response = await http.get(Uri.parse(link));
    String respuesta = response.body;
    List<dynamic> jsonData = jsonDecode(respuesta);
    List<Product> products =
        jsonData.map((item) => Product.fromJson(item)).toList();
    return products;
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
}
