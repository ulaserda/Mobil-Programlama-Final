import 'package:flutter/material.dart';
import 'package:to_do_list/helpers/drawer_navigation.dart';

class MyHomeScreen extends StatefulWidget {
  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(

      ),
      appBar: AppBar(
        title: Text('Yapılacaklar Listem'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 10,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://thumbs.dreamstime.com/b/school-blank-notebook-page-background-texture-notepad-95017353.jpg'), // Ağdan görseli ekliyoruz
            fit: BoxFit.cover, // Görselin tam ekrana yayılmasını sağlıyoruz
          ),
        ),
    ),
    );
  }
}