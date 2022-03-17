import 'package:flutter/material.dart';
import 'package:flutter_food/pages/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Food',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: loginPage(),
    );
  }
}


