import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyListWidget extends StatefulWidget {
  const MyListWidget({super.key});

  @override
  _MyListWidgetState createState() => _MyListWidgetState();
}

class _MyListWidgetState extends State<MyListWidget> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  Future<void> _fetchItems() async {
    final response = await http.get(Uri.parse('https://example.com/items'));
    if (response.statusCode == 200) {
      setState(() {
        items = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My List')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item['title']),
            subtitle: Text(item['subtitle']),
            onTap: () {
              // do something when the item is tapped
            },
          );
        },
      ),
    );
  }
}
