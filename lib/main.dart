import 'package:climate/Provider/Climate.dart';
import 'package:climate/UiElements/splash.dart';
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
        debugShowCheckedModeBanner: false,
      theme: ThemeData(

        
        primarySwatch: Colors.blue,
            primaryColorLight: const Color.fromRGBO(231, 231, 231, 1)
      ),
        home: const splash()
    );
  }
}

