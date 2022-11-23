import 'package:flutter/material.dart';
import 'package:value_key/value_key_using_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Value key',
      home: ValueKeyDemo2(),
    );
  }
}
