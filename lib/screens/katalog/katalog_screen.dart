import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';

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
                    return _createContent(context, e);
                  },
                )),
              );
            }
          }),
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
        Positioned(
          bottom: 8,
          right: 24,
          child: CircularIconButtonWidget(
            icon: Icon(Icons.add_shopping_cart),
            callback: () {},
            size: 40,
          ),
        ),
      ],
    );

/*
    return Container(
      color: Colors.black12,
      height: 200,
      child: Card(
        child: ListTile(

          leading: Container(
            //height: 200,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "http://h2834086.stratoserver.net:8080/data/config/leihladenfulda/images/${e.bilder[0]}"),
              ),
            ),
          ),
          title: Text("${e.bezeichnung}"),
          subtitle: Container(
            color:Colors.red,
            height: 200,
            child: Text(
                "${e.beschreibung.substring(0, min(e.beschreibung.length, 80))}"),
          ),
        ),
      ),
    );
 */
  }
}
