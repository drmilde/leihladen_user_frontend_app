import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';

import 'circular_icon_button_widget.dart';

class ProductCardWidget extends StatelessWidget {
  Eintrag eintrag;
  bool showButton;
  var callback;

  ProductCardWidget(this.eintrag, {this.showButton = true, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _createContent(context, eintrag),
    );
  }

  Widget _createContent(BuildContext context, Eintrag e) {
    double whiteWidth = MediaQuery.of(context).size.width - 2 - 4;
    return Stack(
      children: [
        Container(
          height: 180,
          color: Colors.black12,
        ),
        Positioned(
          top: 2,
          left: 2,
          child: Container(
            height: 176,
            width: whiteWidth,
            color: Colors.white,
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: Container(
            height: 164,
            width: 164,
            //width: double.infinity,
            //color: Colors.green,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 3,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          top: 18.0,
          left: 18.0,
          child: Container(
            height: 144,
            width: 144,
            //width: double.infinity,
            //color: Colors.green,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(
                    "http://h2834086.stratoserver.net:8080/data/config/leihladenfulda/images/${e.bilder[0]}"),
              ),
            ),
          ),
        ),

        /// Text

        Positioned(
          top: 13,
          left: 188,
          child: Container(
            width: 160,
            child: Text(
              e.bezeichnung,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        Positioned(
          top: 58,
          left: 188,
          child: Container(
            color: Colors.white,
            height: 104,
            width: 160,
            child: Text(
              "${e.beschreibung.substring(0, min(e.beschreibung.length, 140))} ...",
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),

        /// Button
        if (showButton)
          Positioned(
            bottom: 8,
            right: 24,
            child: CircularIconButtonWidget(
              icon: Icon(Icons.add_shopping_cart),
              callback: callback,
              size: 40,
            ),
          ),
      ],
    );
  }
}
