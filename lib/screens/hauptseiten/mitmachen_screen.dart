import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/start_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/infotext_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/kachel_grid_widget.dart';

class MitmachenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mitmachen"),
      ),
      drawer: AppDrawerWidget(),
      body: HauptseitenWidget(
        BildWidget("assets/images/header/hand_in_hand.jpg"),
        InfotextWidget("Der Leihladen lebt mit und von Ihnen, unseren Kunden."
            " Wir freuen uns, wenn Sie unser Angebot nutzen."
            " Spenden Sie Dinge, die Sie selten verwenden."),
        KachelGridWidget(260, 130,2,2, StartScreen()),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(3),
    );
  }
}
