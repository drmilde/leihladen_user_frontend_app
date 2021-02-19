import 'package:flutter/material.dart';

class BildWidget extends StatelessWidget {
  String _assetName;

  BildWidget(this._assetName);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(_assetName),
    );
  }
}
