import 'package:flutter/material.dart';

class KachelGridWidget extends StatelessWidget {
  double _cellSize;
  double _width;
  int _zeilen = 2;
  int _spalten = 2;
  Color _cellColor;
  Widget _screen;

  KachelGridWidget(this._width, this._cellSize, this._zeilen, this._spalten, this._screen) {
    // todo tabellen berechnung einfügen
    _width += (16 * _spalten);
  }

  @override
  Widget build(BuildContext context) {
    _cellColor = Theme.of(context).primaryColor;
    return Container(
      width: _width,
      child: Expanded(
        flex: 1,
        child: _createTable(context),
      ),
    );
  }

  Table _createTable(context) {
    List<TableRow> zeilen = [];
    for (int i = 0; i < _zeilen; i++) {
      zeilen.add(_createTableRow(context));
    }
    return Table(
      children: zeilen,
    );
  }

  TableRow _createTableRow(context) {
    List<Widget> spalten = [];
    for (int i = 0; i < _spalten; i++) {
      spalten.add(_createTableCell(context));
    }
    return TableRow(
      children: spalten,
    );
  }

  Padding _createTableCell(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => _screen));
        },
        child: TableCell(
          child: Container(
              color: _cellColor,
              height: _cellSize,
              width: _cellSize,
              child: Placeholder()),
        ),
      ),
    );
  }
}
