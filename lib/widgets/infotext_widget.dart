import 'package:flutter/material.dart';

class InfotextWidget extends StatelessWidget {
  String _infoText;

  InfotextWidget(this._infoText);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _infoText,
        style: TextStyle(
          //fontSize: 15,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
