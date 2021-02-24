import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/config/color_config.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/screens/start_screen.dart';

import 'config/store.dart';

void main() {
  DataModel dm = new DataModel();
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
