import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';

class KatalogScreen extends StatelessWidget {
  List<String> dummyDaten = [
    "Axt",
    "Bohrer",
    "Hammer",
    "Auto",
    "Spiel",
    "Staubsauger",
    "Löffel",
    "Kaffeemaschine",
    "Axt",
    "Bohrer",
    "Hammer",
    "Auto",
    "Spiel",
    "Staubsauger",
    "Löffel",
    "Kaffeemaschine",
    "Axt",
    "Bohrer",
    "Hammer",
    "Auto",
    "Spiel",
    "Staubsauger",
    "Löffel",
    "Kaffeemaschine",
    "Axt",
    "Bohrer",
    "Hammer",
    "Auto",
    "Spiel",
    "Staubsauger",
    "Löffel",
    "Kaffeemaschine",
  ];

  Future<List<Eintrag>> getDataFromAsset() async {
    Katalog k = await Katalog.loadFromAsset();
    k.data.sort((a, b) => (a.bezeichnung.compareTo(b.bezeichnung)));
    return k.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
      ),
      body: FutureBuilder(
          future: getDataFromAsset(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              //print('project snapshot data is: ${projectSnap.data}');
              return Container();
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                child: (ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Eintrag e = snapshot.data[index];
                    return Container(
                      color: Colors.black12,
                      height: 120,
                      child: Card(
                        child: ListTile(
                          leading: Container(
                            height: 100,
                            width: 120,
                            child: Image.network("http://h2834086.stratoserver.net:8080/data/config/leihladenfulda/images/${e.bilder[0]}"),
                          ),
                          title: Text("${e.bezeichnung}"),
                          subtitle: Text(
                              "${e.beschreibung.substring(0, min(e.beschreibung.length, 80))}"),
                        ),
                      ),
                    );
                  },
                )),
              );
            }
          }),
    );
  }
}
