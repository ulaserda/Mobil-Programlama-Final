import 'package:flutter/material.dart';

class ListePage extends StatelessWidget {
  final List<Map<String, dynamic>> items;

  ListePage({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacaklar Listesi"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]['title']),
            leading: Checkbox(
              value: items[index]['completed'],
              onChanged: (bool? value) {
                // Tamamlanma durumu güncellenebilir
              },
            ),
          );
        },
      ),
    );
  }
}
