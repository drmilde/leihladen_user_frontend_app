import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/widgets/bild_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/hauptseiten_widget.dart';

class AbholenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      HauptseitenWidget(
        BildWidget("assets/images/header/zentrum.jpg"),
        Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Image.asset("assets/images/logos/map_dingelstedtstrasse.png"),
        ),
        Container(),
      );
  }
}
