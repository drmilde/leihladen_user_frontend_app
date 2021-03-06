import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/messaging/communication.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/reservierung_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class WarenkorbScreen extends StatefulWidget {
  @override
  _WarenkorbScreenState createState() => _WarenkorbScreenState();
}

class _WarenkorbScreenState extends State<WarenkorbScreen> {
  Communication cm = Communication();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //DataModel.loadStore();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warenkorb"),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              DataModel.store.warenkorb.clearData();
              setState(() {
                // redraw
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveData();
            },
          ),
          IconButton(
              //icon: Icon(Icons.shopping_bag_outlined),
              icon: ImageIcon(
                  AssetImage("assets/images/symbol/order_symbol.png")),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ReservierungScreen()));
              }),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Der Warenkorb zeigt Ihnen Ihre gewählten Dinge."
              " Zum Entfernen wischen Sie den Eintrag zur Seite."
              " Wählen Sie einen Leihzeitraum aus."
              " Zum Vormerken der Dinge drücken Sie den Knopf \"Reservieren\"",
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Leihzeitraum: "),
              CircularIconButtonWidget(
                  icon: Icon(Icons.calendar_today), callback: () {}),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Divider(
            height: 8,
            thickness: 2,
          ),
          Expanded(
            child: FutureBuilder(
                future: Katalog.loadFromAsset(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none &&
                      snapshot.hasData == null) {
                    //print('project snapshot data is: ${projectSnap.data}');
                    return Container();
                  }
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    Katalog katalog = snapshot.data as Katalog;
                    return Container(
                      child: (ListView.builder(
                        itemCount: DataModel.store.warenkorb.data.length,
                        itemBuilder: (context, index) {
                          String inventarnummer =
                              DataModel.store.warenkorb.data[index];
                          Eintrag e = katalog
                              .getEintrayByInventarnummer(inventarnummer);
                          return Dismissible(
                            background: _backgroundDelete(),
                            key: Key(e.inventarnummer +
                                Random.secure().nextInt(10000000).toString()),
                            onDismissed: (direction) {
                              setState(() {
                                DataModel.store.warenkorb
                                    .removeData(e.inventarnummer);
                              });
                            },
                            child: ProductCardWidget(
                              e,
                              showButton: false,
                            ),
                          );
                        },
                      )),
                    );
                  }
                }),
          ),
          Divider(
            height: 8,
            thickness: 2,
          ),
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              "Reservierung",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              String udid = DataModel.store.leihausweis.udid;
              for (int i = 0; i < DataModel.store.warenkorb.data.length; i++) {
                String inventarnummer = DataModel.store.warenkorb.data[i];
                  cm.reservierungAddUdidInventarnummer(udid, inventarnummer, "2021-20-02", "2021-20-03");
              }
            },
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Container _backgroundDelete() {
    return Container(
        color: Colors.red,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("löschen",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("löschen",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        )));
  }

  void _saveData() {
    DataModel.saveStore();
  }
}
