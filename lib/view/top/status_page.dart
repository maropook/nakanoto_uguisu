import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double shortestSide = size.shortestSide;

    return Scaffold(
      body: Center(
        child: Text("準備中", style: TextStyle(fontSize: shortestSide / 22)),
      ),
    );
  }
}
