import 'package:flutter/material.dart';
import 'package:sushi_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sushi App',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue
      ),
      home:  HomePage(),
    );
  }
}
