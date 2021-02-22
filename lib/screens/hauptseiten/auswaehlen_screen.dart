import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/kachel_grid_widget.dart';

class AuswaehlenScreen extends StatelessWidget {
  double cellSize = 100;
  Color cellColor;

  @override
  Widget build(BuildContext context) {
    cellSize = 100;
    cellColor = Theme.of(context).primaryColor;

    List<Widget> cells = [
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/a_z_symbol.png", "A-Z"),
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/haushalt_symbol.png", "Haushalt"),
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/freizeit_symbol.png", "Freizeit"),
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/kinder_symbol.png", "Kinder"),
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/spiele_symbol.png", "Spiele"),
      _buildCell(context, KatalogScreen(),
          "assets/images/symbol/multimedia_symbol.png", "Medien"),
      _buildCell(
          context, KatalogScreen(), "assets/images/symbol/garten_symbol.png", "Garten"),
      _buildCell(context, KatalogScreen(),
          "assets/images/symbol/werkstatt_symbol.png", "Werkzeug"),
      _buildCell(context, KatalogScreen(),
          "assets/images/symbol/sonstiges_symbol.png", "Sonstiges"),
    ];

    return HauptseitenWidget(
      BildWidget("assets/images/header/gemischtwaren_sepia.jpg"),
      KachelGridWidget(
        300,
        100,
        3,
        3,
        KatalogScreen(),
        cells: cells,
      ),
      Container(),
    );
  }

  Padding _buildCell(BuildContext context, Widget screen, String asset, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
            color: cellColor,
            height: cellSize,
            width: cellSize,
            child: Stack(
              children: [
                Positioned(
                  top: cellSize * 0.07,
                  left: cellSize * 0.40 / 2,
                  child: Container(
                    width: cellSize * 0.60,
                    child: Image.asset(asset),
                  ),
                ),
                Positioned(
                  bottom: cellSize * 0.05,
                  child: Container(
                    width: cellSize,
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
