// To parse this JSON data, do
//
//     final katalog = katalogFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/services.dart';

Katalog katalogFromJson(String str) => Katalog.fromJson(json.decode(str));

String katalogToJson(Katalog data) => json.encode(data.toJson());

enum Kategorie {
  AZ,       // 0 -> 0
  Haushalt, // 2 -> 1
  Freizeit, // 7 -> 2
  Kinder,   // 9 -> 3
  Spiel,    // 3 -> 4
  Medien,   // 5 -> 5
  Garten,   // 2 -> 6
  Werkzeug, // 4 -> 7
  Kueche,   // 8 -> 8
  Musik,    // 6 -> 9
  Sonstiges, // 10
  Beliebt,   // 11
  Reserviert, // 12
  Ausgeliehen, // 13
  Verschwunden, // 14
  Defekt, // 15
}


class Katalog {
  Katalog({
    this.version,
    this.stand,
    this.data,
  });

  String version;
  String stand;
  List<Eintrag> data;

  factory Katalog.fromJson(Map<String, dynamic> json) => Katalog(
    version: json["version"],
    stand: json["stand"],
    data: List<Eintrag>.from(json["data"].map((x) => Eintrag.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "stand": stand,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };


  // Load from assets
  static Future<Katalog> loadFromAsset() async {
    String data = await rootBundle.loadString('assets/katalog/json_daten_formatiert.json');
    return katalogFromJson(data.trim());
  }
  
  List<Eintrag> filterKategorie (Kategorie kat) {
    return data.where((e) => e.kategorien.contains(kat.index)).toList();
  }

}

class Eintrag {
  Eintrag({
    this.inventarnummer,
    this.bezeichnung,
    this.bilder,
    this.beschreibung,
    this.dimension,
    this.gewicht,
    this.kleinteil,
    this.kaution,
    this.kosten,
    this.kategorien,
  });

  String inventarnummer;
  String bezeichnung;
  List<String> bilder;
  String beschreibung;
  String dimension;
  String gewicht;
  String kleinteil;
  String kaution;
  String kosten;
  List<int> kategorien;

  factory Eintrag.fromJson(Map<String, dynamic> json) => Eintrag(
    inventarnummer: json["inventarnummer"],
    bezeichnung: json["bezeichnung"],
    bilder: List<String>.from(json["bilder"].map((x) => x)),
    beschreibung: json["beschreibung"],
    dimension: json["dimension"],
    gewicht: json["gewicht"],
    kleinteil: json["kleinteil"],
    kaution: json["kaution"],
    kosten: json["kosten"],
    kategorien: List<int>.from(json["kategorien"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "inventarnummer": inventarnummer,
    "bezeichnung": bezeichnung,
    "bilder": List<dynamic>.from(bilder.map((x) => x)),
    "beschreibung": beschreibung,
    "dimension": dimension,
    "gewicht": gewicht,
    "kleinteil": kleinteil,
    "kaution": kaution,
    "kosten": kosten,
    "kategorien": List<dynamic>.from(kategorien.map((x) => x)),
  };
}
