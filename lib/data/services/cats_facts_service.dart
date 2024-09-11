import 'dart:convert';

import 'package:http/http.dart' as http;

class CatsFactsService {
  Future<Map<dynamic, dynamic>> getFact() async {
    const url = "https://catfact.ninja/fact";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      return data;
    } else {
      throw Exception("Error loading data from API.");
    }
  }
}
