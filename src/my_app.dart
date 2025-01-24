import 'package:flutter/material.dart';
import 'package:to_do_list/screens/my_home_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapılacaklar',
      home: MyHomeScreen(),
    );
  }
}