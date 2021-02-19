import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Katalog"),
      ),
      body: ListView.builder(
          itemCount: dummyDaten.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Container(
                  width: 100,
                  child: Placeholder(
                    color: Theme.of(context).primaryColor,
                    fallbackHeight: 100,
                    fallbackWidth: 100,
                  ),
                ),
                title: Text(dummyDaten[index]),
                subtitle: Text("Hier kommt eine kruze Beschreibung hin. "),
              ),
            );
          }),
    );
  }
}
