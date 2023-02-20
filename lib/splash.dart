import 'dart:async';

import 'package:climate/intro.dart';
import 'package:flutter/material.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const intro())));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
          height: 300,
          width: 400,
          color: Colors.white,
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                height: 100,
                child: Image.asset("assets/logo.png",
                    filterQuality: FilterQuality.high, fit: BoxFit.contain),
              ),
              SizedBox(
                height: 100,
                width: 200,
                child: Image.asset(
                  "assets/title.png",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.contain,
                ),
              ),
              const Spacer(),
            ],
          ))),
    );
  }
}
