import 'package:flutter/material.dart';

class SushiOcto extends StatefulWidget {
  const SushiOcto({super.key,});

  @override
  State<SushiOcto> createState() => _SushiOctoState();
}

class _SushiOctoState extends State<SushiOcto> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("First Page"),
      ),
    );
  }
}