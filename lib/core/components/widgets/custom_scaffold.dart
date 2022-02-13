import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  Widget body;
  CustomScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Hive Manager Example",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: body,
    );
  }
}
