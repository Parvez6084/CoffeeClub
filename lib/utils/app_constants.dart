import 'package:flutter/material.dart';

class AppColors{
  static const backgroundColor = Color(0xFF5B61B9);
  static const lightColor = Color(0xFFE0E5EC);
  static const blackColor = Color(0xFF292D32);
  static const darkSwColor = Color(0xFFA3B1C6);
  static const boxUnSeen = [
    BoxShadow(
      color: Colors.white,
      offset: Offset(-1.0, -1.0),
      blurStyle: BlurStyle.solid,
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: darkSwColor,
      offset: Offset(1.0, 1.0),
      blurStyle: BlurStyle.solid,
      blurRadius: 1.0,
    ),
  ];
  static const boxSeen = [
    BoxShadow(
      color: Colors.white,
      offset: Offset(1.0, 1.0),
      blurStyle: BlurStyle.inner,
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: darkSwColor,
      offset: Offset(-1.0, -1.0),
      blurStyle: BlurStyle.inner,
      blurRadius: 1.0,
    ),
  ];
  static final boxDarkSDW = [
    BoxShadow(
      color: Colors.white.withOpacity(0.1),
      offset: const Offset(1.0, 1.0),
      blurStyle: BlurStyle.inner,
      blurRadius: 1.0,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.4),
      offset: const Offset(-1.0, -1.0),
      blurStyle: BlurStyle.inner,
      blurRadius: 1.0,
    ),
  ];

}


const double dividerSize = 70;
