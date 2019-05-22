import 'package:flutter/material.dart';

class DesertScreen extends StatefulWidget {
  @override
  DesertPageState createState() => DesertPageState();
}

class DesertPageState extends State<DesertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Text('Desert', style: TextStyle(color: Colors.white))
          ),
        ));
  }
}
