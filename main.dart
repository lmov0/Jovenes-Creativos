import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "Inicio.dart";
import "dart:async";

void main() {
  runApp(MaterialApp(
    home: SplashScreen(),
  ));
}

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Iniciopage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.maxFinite,
              width: double.maxFinite,
              color: Colors.orange,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.cloud_queue,
                  size: 150.0,
                    color: Colors.amber,
                  ) ,
                  Text("Proyecto Final ",
                    style: TextStyle(
                    color: Colors.amber,
                    fontSize: 30.0,
                    fontFamily: "OpenSans" ,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
