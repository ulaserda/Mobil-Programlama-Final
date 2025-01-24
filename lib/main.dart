import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do_list/screens/my_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBJHc9faiIJbRdQd8rFoU3fdP-gmp-BnCs",
      authDomain: "to-do-list-3cb10.firebaseapp.com",
      projectId: "to-do-list-3cb10",
      storageBucket: "to-do-list-3cb10.appspot.com",
      messagingSenderId: "680855232441",
      appId: "1:680855232441:web:b7a55794df888ad7312068",
      measurementId: "G-BYTHZLMLXF",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yapılacaklar',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomeScreen(),
    );
  }
}
