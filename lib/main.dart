import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_proportion/screens/menu_screen.dart';
import 'package:my_proportion/screens/product_exchange_screen.dart';

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
      onGenerateRoute: (settings) {
        if (settings.name == '/product_exchange_screen') {
          return MaterialPageRoute(
              builder: (_) =>
                  ProductsExchangeScreen(productId: settings.arguments));
        }
        assert(settings.name == '/');
        return MaterialPageRoute(builder: (_) => MenuScreen());
      },
    );
  }
}
