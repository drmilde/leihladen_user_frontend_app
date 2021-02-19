import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';

class AbholenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abholen"),
      ),
      drawer: AppDrawerWidget(),
      body: HauptseitenWidget(
        BildWidget("assets/images/header/zentrum.jpg"),
        Container(
          height: MediaQuery.of(context).size.height - 300,
          width: MediaQuery.of(context).size.width,
          child: Placeholder(),
        ),
        Container(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(2),
    );
  }
}
