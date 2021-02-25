import 'dart:math';

import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class WarenkorbScreen extends StatefulWidget {
  @override
  _WarenkorbScreenState createState() => _WarenkorbScreenState();
}

class _WarenkorbScreenState extends State<WarenkorbScreen> {
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
          SizedBox(
            height: 16,
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
            height: 16,
          ),
          Divider(
            height: 10,
            thickness: 2,
          ),
          SizedBox(
            height: 16,
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
            height: 10,
            thickness: 2,
          ),
          SizedBox(
            height: 8,
          ),
          RaisedButton(
            child: Text("Reservierung"),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Container _backgroundDelete() {
    return Container(
                            color: Colors.red,
                            child: Center(child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("löschen", style: TextStyle(fontSize: 20, color: Colors.white)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("löschen", style: TextStyle(fontSize: 20, color: Colors.white)),
                                ),
                              ],
                            ))
                          );
  }

  void _saveData() {
    DataModel.saveStore();
  }
}
