import 'package:flutter/material.dart';
import '/themes/themes.dart';

changingVariousTypeChange(typeChange) {
  final double iconSize = 30.0;
  switch (typeChange) {
    case 1:
      return Icon(Icons.circle_outlined, color: Colors.red, size: iconSize);

    case 2:
      return Icon(Icons.circle_outlined, color: Colors.yellow, size: iconSize);

    case 3:
      return Icon(Icons.circle_outlined, color: Colors.green, size: iconSize);

    case 4:
      return Icon(Icons.star_border_outlined,
          color: CustomColors.gold, size: iconSize);

    default:
      return Icon(Icons.star_border_outlined,
          color: CustomColors.gold, size: iconSize);
  }
}
