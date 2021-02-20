import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/config/color_config.dart';
import 'package:leihladen_user_frontend_app/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Die Leihladen App',
      theme: new ThemeData(
        primaryColor: ColorConfig.fromHex("#FF35ac57"),
        primaryColorDark: ColorConfig.fromHex("#FF23733a"),
        accentColor: ColorConfig.fromHex("#FF82fcd7"),
        scaffoldBackgroundColor: ColorConfig.fromHex("#FFFFFFFF"),
        bottomAppBarColor: ColorConfig.fromHex("#FFEEEEEE"),
      ),
      home: StartScreen(),
    );
  }
}
