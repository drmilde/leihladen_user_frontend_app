
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/warenkorb_screen.dart';
import 'package:leihladen_user_frontend_app/screens/katalog/katalog_detail_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class KatalogScreen extends StatefulWidget {
  Kategorie kategorie = Kategorie.AZ;

  KatalogScreen({this.kategorie = Kategorie.AZ});

  @override
  _KatalogScreenState createState() => _KatalogScreenState();
}

class _KatalogScreenState extends State<KatalogScreen> {
  void setFilterKategorie(Kategorie kat) {
    this.widget.kategorie = kat;
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
          "${KategorieNamen[widget.kategorie.index]}",
          textAlign: TextAlign.center,
        ),
        actions: [
          FlatButton(
            child: Badge(
              badgeColor: Colors.white,
              badgeContent: Text("${DataModel.store.warenkorb.data.length}"),
              child: ImageIcon(
                AssetImage("assets/images/symbol/warenkorb_symbol.png"),
                color: Colors.white,
              ),
            ),
            onPressed: () {
              //generalDialog(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WarenkorbScreen(),
                  )).then((value) {
                setState(() {
                  // update
                });
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
          future: getDataFromAsset(kategorie: widget.kategorie),
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => KatalogDetailScreen(
                                  eintrag: e,
                                )));
                      },
                      child: ProductCardWidget(
                        e,
                        callback: () {
                          DataModel.store.warenkorb.addData(e.inventarnummer);
                          setState(() {

                          });
                        },
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
