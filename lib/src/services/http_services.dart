import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mgv6app/src/constants/endpoints.dart';

class HttpServices {
  static Future<Map<String, dynamic>> getProductById(id) async {
    final response = await http
        .get(Uri.parse("${Endpoints.baseUrl}${Endpoints.product}/$id"));
    return jsonDecode(response.body);
  }

  static Future<List> getBalances() async {
    final response =
        await http.get(Uri.parse("${Endpoints.baseUrl}${Endpoints.balance}"));
    return jsonDecode(response.body);
  }
}
