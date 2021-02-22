import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/kachel_grid_widget.dart';

class AuswaehlenScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double cellSize = ((MediaQuery.of(context).size.width - 16) / 3) - 16;
    Color cellColor = Theme.of(context).primaryColor;

    List<Widget> cells = [
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/a_z_symbol.png",
        "A-Z",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/haushalt_symbol.png",
        "Haushalt",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/freizeit_symbol.png",
        "Freizeit",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/kinder_symbol.png",
        "Kinder",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/spiele_symbol.png",
        "Spiele",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/multimedia_symbol.png",
        "Medien",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/garten_symbol.png",
        "Garten",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/werkstatt_symbol.png",
        "Werkzeug",
        cellColor,
        cellSize,
      ),
      KachelGridWidget.buildCell(
        context,
        KatalogScreen(),
        "assets/images/symbol/sonstiges_symbol.png",
        "Sonstiges",
        cellColor,
        cellSize,
      ),
    ];

    return HauptseitenWidget(
      BildWidget("assets/images/header/gemischtwaren_sepia.jpg"),
      KachelGridWidget(
        cellSize * 3,
        cellSize,
        3,
        3,
        KatalogScreen(),
        cells: cells,
      ),
      Container(),
    );
  }
}
