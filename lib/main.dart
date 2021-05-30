import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/menu_screen.dart';
import './models/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        title: 'Menu',
        theme: ThemeData(
          primaryColor: Colors.teal,
          primarySwatch: Colors.amber,
          accentColor: Colors.orange,
        ),
        home: MenuScreen(),
      ),
    );
  }
}
