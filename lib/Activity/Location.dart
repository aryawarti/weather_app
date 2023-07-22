import 'package:flutter/material.dart';

class Locatioin extends StatefulWidget {
  const Locatioin({Key? key}) : super(key: key);

  @override
  State<Locatioin> createState() => _LocatioinState();
}

class _LocatioinState extends State<Locatioin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Text('Location Activity'),
    );
  }
}
