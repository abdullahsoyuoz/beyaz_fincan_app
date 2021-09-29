import 'package:flutter/material.dart';

class ExitPage extends StatefulWidget {
  const ExitPage({ Key key }) : super(key: key);

  @override
  _ExitPageState createState() => _ExitPageState();
}

class _ExitPageState extends State<ExitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Exit Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 34,
          ),
        ),
      ),
    );
  }
}