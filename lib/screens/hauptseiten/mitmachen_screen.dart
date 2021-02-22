import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_screen.dart';
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
    double cellSize = ((MediaQuery.of(context).size.width - 16) / 2.5) - 16;
    Color cellColor = Theme.of(context).primaryColor;

    List<Widget> cells = [
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/chat_symbol.png",
        "Neuigkeiten",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/beliebt_symbol.png",
        "Wunschliste",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/wunschliste_symbol.png",
        "Vorschläge",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/message_symbol.png",
        "Fragen",
        cellColor,
        cellSize,
      ),
    ];

    return HauptseitenWidget(
        BildWidget("assets/images/header/hand_in_hand.jpg"),
        InfotextWidget("Der Leihladen lebt mit und von Ihnen, unseren Kunden."
            " Wir freuen uns, wenn Sie unser Angebot nutzen."
            " Spenden Sie Dinge, die Sie selten verwenden."),
        //KachelGridWidget(260, 130, 2, 2, StartScreen()),
        KachelGridWidget(
          cellSize * 2,
          cellSize,
          2,
          2,
          KatalogScreen(),
          cells: cells,
        ));
  }
}
