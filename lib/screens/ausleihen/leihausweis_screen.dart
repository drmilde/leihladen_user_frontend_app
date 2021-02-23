import 'package:flutter/material.dart';

class LeihausweisScreen extends StatefulWidget {
  @override
  _LeihausweisScreenState createState() => _LeihausweisScreenState();
}

class _LeihausweisScreenState extends State<LeihausweisScreen> {
  String UDID = "Ihre Ausweisnummer";

  TextEditingController _controllerName = TextEditingController();

  TextEditingController _controllerVorname = TextEditingController();

  TextEditingController _controllerAdresse = TextEditingController();

  TextEditingController _controllerEmail = TextEditingController();

  TextEditingController _controllerPasswort = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leihausweis"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: _validateForm,
          ),
          IconButton(
            icon: Icon(Icons.qr_code),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Füllen Sie bitte das Formular aus und erstellen Sie so Ihren digitalen Leihausweis."
                    " Mit dem digitalen Leihausweis weisen Sie sich vor Ort im Leihladen aus."
                    " Ihre Daten werden *NICHT* übertragen und ausschliesslich auf Ihrem Handy gespeichert."
                    " Wir haben keinen Zugriff auf Ihrer personenbezogenen Daten."
                    "\n\nIhre Ausweisnummer: ${UDID.hashCode}",
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _updateUdid();
                    },
                    controller: _controllerName,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _updateUdid();
                    },
                    controller: _controllerVorname,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Vorname',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _updateUdid();
                    },
                    controller: _controllerAdresse,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Adresse',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      _updateUdid();
                    },
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerPasswort,
                    onChanged: (value) {
                      _updateUdid();
                    },
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Wählen Sie ein beliebiges Passwort.",
                      labelText: 'Passwort',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateUdid() {
    String name = _controllerName.text.trim();
    String vorname = _controllerVorname.text.trim();
    String adresse = _controllerAdresse.text.trim();
    String email = _controllerEmail.text.trim();
    String passwort = _controllerPasswort.text.trim();
    setState(() {
      UDID = "${name}:${vorname}:${adresse}:${email}:${passwort}";
    });
  }

  void _validateForm() {
    String name = _controllerName.text.trim();
    String vorname = _controllerVorname.text.trim();
    String adresse = _controllerAdresse.text.trim();
    String email = _controllerEmail.text.trim();
    String passwort = _controllerPasswort.text.trim();

    if (name.isEmpty) {
      showMessage("Bitte geben Sie einen Namen ein");
      return;
    }
    if (vorname.isEmpty) {
      showMessage("Bitte geben Sie einen Vornamen ein");
      return;
    }
    if (adresse.isEmpty) {
      showMessage("Bitte geben Sie eine Adresse ein");
      return;
    }
    if (email.isEmpty) {
      showMessage("Bitte geben Sie eine email ein");
      return;
    }
    if (passwort.isEmpty) {
      showMessage("Bitte geben Sie ein Passwort ein");
      return;
    }
    _updateUdid();
    _saveData();
    Navigator.of(context).pop();
  }

  void showMessage(String msg) {
    //TODO NAchricht anzeigen
  }

  void _saveData() {
    //TODO Leihausweis speichern
  }
}
