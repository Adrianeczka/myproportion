import 'package:flutter/material.dart';
import '../widgets/menu_item.dart';
import '../models/products.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<Products>(context).fetchAndSetProducts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('My menu for today'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemBuilder: (ctx, i) => MenuItem(
          products[i].id,
          products[i].productName,
          products[i].weight,
        ),
        itemCount: products.length,
      ),
    );
  }
}
