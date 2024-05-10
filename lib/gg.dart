import 'package:flutter/material.dart';

class tesrScreen extends StatefulWidget {
  const tesrScreen({super.key});

  @override
  State<tesrScreen> createState() => _tesrScreenState();
}

class _tesrScreenState extends State<tesrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hi"),
      ),
    );
  }
}
