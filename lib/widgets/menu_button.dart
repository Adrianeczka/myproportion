import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String nameMenuButton;
  final IconData? iconMenuButton;
  MenuButton(this.nameMenuButton, this.iconMenuButton);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      // width: 180,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 20),
            blurRadius: 30,
            color: Colors.black12,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              print('You clicked button $nameMenuButton');
            },
            child: Container(
                height: 50,
                width: 150,
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Text(nameMenuButton, style: TextStyle(fontSize: 17)),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(95),
                      topRight: Radius.circular(150),
                      topLeft: Radius.circular(95),
                    ))),
          ),
          Icon(
            iconMenuButton,
            size: 22,
            color: Colors.redAccent[100],
          )
        ],
      ),
    );
  }
}
