import 'package:flutter/material.dart';

class RemoveAdsPage extends StatefulWidget {
  const RemoveAdsPage({ Key key }) : super(key: key);

  @override
  _RemoveAdsPageState createState() => _RemoveAdsPageState();
}

class _RemoveAdsPageState extends State<RemoveAdsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Remove Ads Screen',
          style: TextStyle(
            color: Colors.black,
            fontSize: 34,
          ),
        ),
      ),
    );
  }
}