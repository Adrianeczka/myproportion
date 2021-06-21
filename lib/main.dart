import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/menu_screen.dart';

void main() => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyProportion',
      theme: ThemeData(
        primaryColor: Colors.teal,
        primarySwatch: Colors.amber,
        accentColor: Colors.orange,
      ),
      home: MenuScreen(),
    );
  }
}
