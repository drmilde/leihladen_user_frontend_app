import 'package:flutter/material.dart';

class KachelGridWidget extends StatelessWidget {
  double _cellSize;
  double _width;
  int _zeilen = 2;
  int _spalten = 2;
  Color _cellColor;
  Widget _screen;

  // Content Widgets
  List<Widget> cells = [];
  int _count = 0;

  KachelGridWidget(
      this._width, this._cellSize, this._zeilen, this._spalten, this._screen,
      {this.cells = null}) {
    // todo tabellen berechnung einfügen
    _width += (16 * _spalten);
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    _cellColor = Theme.of(context).primaryColor;
    return _createTable(context);
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
}
