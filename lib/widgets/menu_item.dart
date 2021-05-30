import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String id;
  final String productName;
  final String weight;

  MenuItem(this.id, this.productName, this.weight);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.star_border),
      title: Text(productName),
      trailing: Text(weight),
    );
  }
}
