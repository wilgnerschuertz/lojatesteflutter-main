// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:lojatesteflutter/views/home/home_page_product%20copy.dart';
import 'views/home/home_page_product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Fire',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeProductTESTE(),
    );
  }
}
