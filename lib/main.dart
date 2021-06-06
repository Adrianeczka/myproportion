import 'package:flutter/material.dart';
import '../screens/menu_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.amber,
        accentColor: Colors.orange,
      ),
      home: MenuScreen(),
    );
  }
}
