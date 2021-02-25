import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/config/store.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/warenkorb_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class KatalogScreen extends StatelessWidget {
  Kategorie kategorie = Kategorie.AZ;

  KatalogScreen({this.kategorie = Kategorie.AZ});

  void setFilterKategorie(Kategorie kat) {
    this.kategorie = kat;
  }

  List<String> KategorieNamen = [
    "A-Z",
    "Haushalt",
    "Freizeit",
    "Kinder",
    "Spiele",
    "Medien",
    "Garten",
    "Werkzeug",
    "Musik",
    "Küche",
    "Sonstige",
  ];

  Future<List<Eintrag>> getDataFromAsset(
      {Kategorie kategorie = Kategorie.AZ}) async {
    Katalog k = await Katalog.loadFromAsset();
    List<Eintrag> liste = k.filterKategorie(kategorie);
    liste.sort((a, b) => (a.bezeichnung.compareTo(b.bezeichnung)));
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "${KategorieNamen[kategorie.index]}",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => WarenkorbScreen()));
              })
        ],
      ),
      body: FutureBuilder(
          future: getDataFromAsset(kategorie: kategorie),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Eintrag> liste = snapshot.data as List<Eintrag>;
              return Container(
                child: (ListView.builder(
                  itemCount: liste.length,
                  itemBuilder: (context, index) {
                    Eintrag e = liste[index];
                    //return _createContent(context, e);
                    return ProductCardWidget(e);
                  },
                )),
              );
            }
          }),
    );
  }
}
