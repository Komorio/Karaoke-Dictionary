import 'package:flutter/material.dart';
import 'package:karaoke_dictionary/consts/constant.dart';
import 'package:karaoke_dictionary/screens/main_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Constant.primaryTheme,
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );    
  }
}
