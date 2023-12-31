import 'package:flutter/material.dart';
import 'package:flutter_travel_app/pages/detail_page.dart';
import 'package:flutter_travel_app/pages/home_page.dart';
import 'package:flutter_travel_app/pages/navpages/main_page.dart';
import 'package:flutter_travel_app/pages/navpages/my_page.dart';
import 'package:flutter_travel_app/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DetailPage(),
    );
  }
}
