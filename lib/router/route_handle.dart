import 'package:flutter/material.dart';

import '../home.dart';
class RouteMap {
  static final routes = <String, WidgetBuilder>{
    '/home': (BuildContext context) => MainHomePage(),
  };
}