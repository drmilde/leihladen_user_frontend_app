import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/infotext_widget.dart';

class AusleihenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ausleihen"),
      ),
      drawer: AppDrawerWidget(),
      body: HauptseitenWidget(
        BildWidget("assets/images/header/lastenrad.jpg"),
        InfotextWidget("Legen Sie zunächst die Dinge in den Warenkorb,"
            " dann reservieren Sie die Dinge"
            " für den gewünschten Zeitraum."
            " Beim Abholen legen Sie Ihren Leihausweis vor."),
        Container(
          height: 300,
          width: 300,
          child: Placeholder(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(1),
    );
  }
}
