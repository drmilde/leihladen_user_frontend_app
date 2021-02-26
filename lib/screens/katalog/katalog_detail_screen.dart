import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';

class KatalogDetailScreen extends StatelessWidget {
  Eintrag eintrag;

  KatalogDetailScreen({this.eintrag});

  @override
  Widget build(BuildContext context) {
    String title = eintrag.bezeichnung ?? "Details";
    if (title.indexOf(" ") > 0) {
      title = title.substring(0, title.indexOf(" "));
    }

    return Scaffold(
      appBar: AppBar(title: Text("${eintrag.inventarnummer}")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DataModel.store.warenkorb.addData(eintrag.inventarnummer);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add_shopping_cart),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  eintrag.bezeichnung,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Colors.transparent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.6,
                      width: MediaQuery.of(context).size.width * 0.6,
                      //width: double.infinity,
                      //color: Colors.green,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: NetworkImage(
                              "http://h2834086.stratoserver.net:8080/data/config/leihladenfulda/images/${eintrag.bilder[0]}"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                "Beschreibung",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                eintrag.beschreibung,
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Eigenschaften",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Table(
                children: [
                  _createRow("Bezeichnung", "${title}",
                      background: true, valbold: true),
                  _createRow("Status", "${eintrag.inventarnummer}"),
                  _createRow("Leihgebühr", "${eintrag.kosten}"),
                  _createRow("Pfand", "${eintrag.kaution}"),
                  _createRow("Kleinteil", "${eintrag.kleinteil}"),
                  _createRow("Dimension", "${eintrag.dimension}"),
                  _createRow("Gewicht", "${eintrag.gewicht}"),
                  _createRow("Inventarnummer", "${eintrag.inventarnummer}"),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }

  TableRow _createRow(String att, String val,
      {bool background = false, bool valbold = false}) {
    return TableRow(
        decoration: BoxDecoration(
          color: background ? Colors.black12 : Colors.white,
        ),
        children: [
          TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${att}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              )),
          TableCell(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${val}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: valbold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          )),
        ]);
  }
}
