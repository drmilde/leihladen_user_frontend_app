import 'package:flutter/material.dart';

class KachelGridWidget extends StatelessWidget {
  double _cellSize;
  double _width;
  int _zeilen = 2;
  int _spalten = 2;
  Color _cellColor = Colors.green;
  Widget _screen;

  // Content Widgets
  List<Widget> cells = [];
  int _count = 0;

  KachelGridWidget(
      this._width, this._cellSize, this._zeilen, this._spalten, this._screen,
      {this.cells = const []}) {
    // todo tabellen berechnung einfügen
    _width += (16 * _spalten);
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    _cellColor = Theme.of(context).primaryColor;
    return Container(
      width: _width,
      child: _createTable(context),
    );
  }

  Table _createTable(context) {
    List<TableRow> zeilen = [];
    _count = 0;
    for (int i = 0; i < _zeilen; i++) {
      zeilen.add(_createTableRow(context));
    }
    return Table(
      children: zeilen,
    );
  }

  TableRow _createTableRow(context) {
    List<TableCell> spalten = [];
    for (int i = 0; i < _spalten; i++) {
      spalten.add(_createTableCell(context));
      _count++;
    }
    return TableRow(
      children: spalten,
    );
  }

  TableCell _createTableCell(context) {
    return TableCell(
      child: _createCell(context),
    );
  }

  Padding _createCell(context) {
    if (cells == null) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => _screen));
          },
          child: Container(
              color: _cellColor,
              height: _cellSize,
              width: _cellSize,
              child: Placeholder()),
        ),
      );
    } else {
      return cells[_count];
    }
  }

  static Widget buildCell(BuildContext context, Widget screen, String asset,
      String text, Color cellColor, double cellSize, {double marginFactor = 0.07, double scaleFactor = 0.6}) {
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
                  top: cellSize * marginFactor,
                  left: cellSize * (1.0 - scaleFactor) / 2,
                  child: Container(
                    width: cellSize * scaleFactor,
                    child: Image.asset(asset),
                  ),
                ),
                Positioned(
                  bottom: cellSize * marginFactor,
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
