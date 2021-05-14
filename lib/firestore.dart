import 'package:flutter/material.dart';

class Tela extends StatefulWidget {
  @override
  _TelaState createState() => _TelaState();
}

class _TelaState extends State<Tela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Icon(Icons.menu),
        actions: [
          Icon(Icons.email),
          Icon(Icons.email),
          SizedBox(
            width: 100,
            child: TextField(),
          )
        ],
      ),
    );
  }
}
