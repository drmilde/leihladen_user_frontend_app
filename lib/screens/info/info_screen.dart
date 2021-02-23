import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Das Bürgerzentrum"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset("assets/images/header/zentrum.jpg"),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Adresse, Kontakt & Anfahrt",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Leihladen Fulda"
                            "\nDingelstedtstrasse 12"
                            "\n36043 Fulda",
                          ),
                          CircularIconButtonWidget(
                              icon: Icon(Icons.navigation), callback: null)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Telefon: +49 1573 725 8582"
                            "\nemail: leihladenfulda@gmail.com",
                          ),
                          CircularIconButtonWidget(icon: Icon(Icons.call), callback: null)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Anfahrt: "
                          "Das Bürgerzentrum Fulda-Ziehers-Süd liegt im Stadtgebiet"
                          " Ziehers-Süd in der Nähe der B27."
                          " Nehmen sie die "
                          " Abfahrt \"Petersberger Straße\", "
                          "dann in die \"Dr. Dietz-Straße\" und dann"
                          " in die \"Dingelstedtstraße\"."),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Öffnungszeiten",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Aufgrund der Corona-Pandemie gelten im Bürgerzentrum die aktuellen"
                          " Hygenie-bestimmungen."
                          " Sie erreichen uns telefonisch."
                          " Der Leihladen Fulda wird am 4.9.2020"
                          " seine Arbeit aufnehmen, und ist dann jeden"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Freitag"
                          " zwischen 16.00 und 17.30 Uhr"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("für Sie geöffnet."
                          " Reservierungen sind über die App natürlich jederzeit möglich."),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Bauliche Situation",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Das Bürgerzentrum Ziehers Süd wurde aufwändig zu einer"
                          " Multifunktionshalle umgebaut"
                          " und im Jahre 2019 eröffnet. Es eignet sich sowohl"
                          " für größere Veranstaltungen von bis zu 540 Personen"
                          " (unbestuhlt), als auch für Familienfeiern jeglicher"
                          " Art für bis zu 180 Personen (mit Tischen und Stühlen)."
                          " Der Bühnenraum ist separat nutzbar."
                          " Des weiteren steht ein kleiner Gruppenraum"
                          " (20 Personen) mit Teeküche zur Verfügung."
                          " Das Zentrum ist barrierefrei konzipiert:"),
                      SizedBox(
                        height: 10,
                      ),
                      Text("- Barrierefreier Zugang zu allen Ebenen: ja\n"
                          "- Barrierefreier Zugang zum Saal: ja\n"
                          "- Anzahl der Schwerbehindertenparkplätze: 2\n"
                          "- Alle Räume stufenlos zu erreichen: ja\n"
                          "- Behindertengerechte Toiletten: ja, im EG"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
