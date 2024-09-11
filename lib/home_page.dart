import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map fact = {};
  Future<void> fetchData() async {
    const url = "https://catfact.ninja/fact";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map;
      setState(() {
        fact = data;
      });
    } else {
      throw Exception("Error loading data from API.");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            fact["fact"],
          ),
          TextButton(
            onPressed: () {
              fetchData();
            },
            child: const Text(
              "Next",
            ),
          ),
        ],
      ),
    );
  }
}
