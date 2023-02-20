import 'package:climate/Climate.dart';
import 'package:climate/intro.dart';
import 'package:climate/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ClimateProvider())],
      child: const MyApp()));
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        
        primarySwatch: Colors.blue,
            primaryColorLight: const Color.fromRGBO(231, 231, 231, 1)
      ),
        home: const splash()
    );
  }
}

