import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/home_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/product_exchange_screen.dart';

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
          fontFamily: 'Montserrat',
          primaryColor: Colors.teal[100],
          primarySwatch: Colors.blueGrey),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case '/menu_screen':
            return MaterialPageRoute(builder: (_) => MenuScreen());
          case '/product_exchange_screen':
            return MaterialPageRoute(
                builder: (_) =>
                    ProductsExchangeScreen(productDay: settings.arguments));

          default:
            return MaterialPageRoute(
                builder: (_) => Scaffold(
                      body: Center(
                          child: Text('No route defined for ${settings.name}')),
                    ));
        }
      },
    );
  }
}
