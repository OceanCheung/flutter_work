import 'package:flutter/material.dart';
import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "我的应用",
        theme: new ThemeData(primaryColor: Colors.blue),
        home: HomePage());
  }
}
