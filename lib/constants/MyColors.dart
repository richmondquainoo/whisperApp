import 'package:flutter/material.dart';

Color primaryColor = Color(0xFFB91646);
const kPrimaryColor1 = Color(0xFFB91646);
const kPrimaryColor2 = Color(0xFFF6D167);
const kPrimaryColor3 = Color(0xFF4B6587);
const kPrimaryColor4 = Color(0xFF630A10);
const kPrimaryColor5 = Color(0xFFeae1e1);
const kPrimaryColor6 = Color(0xFFA2D2FF);




Color getColorIndex(int idx){
  switch(idx){
    case 1:
      return Colors.red;
      break;
    case 2:
      return Colors.teal;
      break;
    case 3:
      return Colors.pink;
      break;
    case 4:
      return Colors.orange;
      break;
    case 5:
      return Colors.deepPurpleAccent;
      break;
  }
  return Colors.blueAccent;
}