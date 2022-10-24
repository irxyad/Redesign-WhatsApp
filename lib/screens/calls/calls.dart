import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  //routes
  static String routeName = '/calls';
  const Calls({Key? key}) : super(key: key);

  @override
  State<Calls> createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Text(
              "No recents calls",
              style: TextStyle(
                  fontFamily: 'Helvetica', fontSize: 16, color: Colors.black),
            ),
          ),
        ));
  }
}
