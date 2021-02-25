import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/widgets/circular_icon_button_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class WarenkorbScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Warenkorb"),
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
                          return ProductCardWidget(
                            e,
                            showButton: false,
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
}
