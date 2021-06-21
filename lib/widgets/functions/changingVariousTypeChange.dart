import 'package:flutter/material.dart';

changingVariousTypeChange(typeChange) {
  switch (typeChange) {
    case 1:
      return Icon(Icons.circle_outlined, color: Colors.red);

    case 2:
      return Icon(Icons.circle_outlined, color: Colors.yellow);

    case 3:
      return Icon(Icons.circle_outlined, color: Colors.green);

    case 4:
      return Icon(Icons.star_border_outlined, color: Color(0xFFffd700));

    default:
      return Icon(Icons.star_border_outlined, color: Color(0xFFffd700));
  }
}
