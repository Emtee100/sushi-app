import 'package:flutter/material.dart';

class SushiSalmon extends StatefulWidget {
  const SushiSalmon({super.key});

  @override
  State<SushiSalmon> createState() => _SushiSalmonState();
}

class _SushiSalmonState extends State<SushiSalmon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
    );
  }
}