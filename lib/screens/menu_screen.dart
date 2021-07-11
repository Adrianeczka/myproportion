import 'package:flutter/material.dart';
import '../widgets/menu_button.dart';

class MenuScreen extends StatelessWidget {
  final List nameMenuButton = [
    'Posiłki',
    'Jadłospisy',
    'Proporcja',
    'Moje obwody'
  ];
  final List<IconData> iconMenuButton = [
    Icons.restaurant,
    Icons.food_bank,
    Icons.swap_vert_circle,
    Icons.monitor_weight
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 220,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: MenuButton(nameMenuButton[index], iconMenuButton[index]),
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
