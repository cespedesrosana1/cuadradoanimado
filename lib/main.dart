import 'package:animation_controller/src/pages/headers_page.dart';
import 'package:flutter/material.dart';


 

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños App',
      home: HeadersPage()
    );
  }
}