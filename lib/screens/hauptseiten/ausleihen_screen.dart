import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/entliehen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/leihausweis_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/reservierung_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/warenkorb_screen.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/infotext_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/kachel_grid_widget.dart';

class AusleihenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double cellSize = ((MediaQuery.of(context).size.width - 16) / 2.5) - 16;
    Color cellColor = Theme.of(context).primaryColor;

    List<Widget> cells = [
      KachelGridWidget.buildCell(
        context,
        LeihausweisScreen(),
        "assets/images/symbol/leihausweis_symbol.png",
        "Leihausweis",
        cellColor,
        cellSize,
        marginFactor: 0.1,
        scaleFactor: 0.5,
      ),
      KachelGridWidget.buildCell(
        context,
        WarenkorbScreen(),
        "assets/images/symbol/warenkorb_symbol.png",
        "Warenkorb",
        cellColor,
        cellSize,
        marginFactor: 0.1,
        scaleFactor: 0.5,
      ),
      KachelGridWidget.buildCell(
        context,
        ReservierungScreen(),
        "assets/images/symbol/order_symbol.png",
        "Reservierung",
        cellColor,
        cellSize,
        marginFactor: 0.1,
        scaleFactor: 0.5,
      ),
      KachelGridWidget.buildCell(
        context,
        EntliehenScreen(),
        "assets/images/symbol/entliehen_symbol.png",
        "Entliehen",
        cellColor,
        cellSize,
        marginFactor: 0.1,
        scaleFactor: 0.5,
      ),
    ];

    return HauptseitenWidget(
      BildWidget("assets/images/header/lastenrad.jpg"),
      InfotextWidget("Legen Sie zunächst die Dinge in den Warenkorb,"
          " dann reservieren Sie die Dinge"
          " für den gewünschten Zeitraum."
          " Beim Abholen legen Sie Ihren Leihausweis vor."),
      //KachelGridWidget(260, 130, 2, 2, StartScreen()),
        KachelGridWidget(
          cellSize * 2,
          cellSize,
          2,
          2,
          KatalogScreen(),
          cells: cells,
        )
    );
  }
}
