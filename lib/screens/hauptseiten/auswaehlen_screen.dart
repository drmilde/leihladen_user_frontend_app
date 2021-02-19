import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/kachel_grid_widget.dart';

class AuswaehlenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Auswählen"),
      ),
      drawer: AppDrawerWidget(),
      body: HauptseitenWidget(
        BildWidget("assets/images/header/gemischtwaren_sepia.jpg"),
        KachelGridWidget(300, 100, 3, 3, KatalogScreen()),
        Container(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(0),
    );
  }
}
