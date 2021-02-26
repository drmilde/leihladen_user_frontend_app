import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/messaging/answer.dart';
import 'package:leihladen_user_frontend_app/messaging/communication.dart';
import 'package:leihladen_user_frontend_app/model/data_model.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class ReservierungScreen extends StatefulWidget {
  @override
  _ReservierungScreenState createState() => _ReservierungScreenState();
}

class _ReservierungScreenState extends State<ReservierungScreen> {
  Communication cm = Communication();

  @override
  Widget build(BuildContext context) {
    Katalog katalog;
    Katalog.loadFromAsset().then((result) {
      katalog = result;
    });

    return Scaffold(
        appBar: AppBar(
          title: Text("Reservierung"),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                String udid = DataModel.store.leihausweis.udid;
                cm.reservierungDeleteUdid(udid);
                setState(() {
                  // redraw
                });
              },
            ),
          ],
        ),
        body: Container(
          //child: _buildFutureBuilderAnserlist(katalog),
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
                  return _buildFutureBuilderAnserlist(katalog);
                }
              }),
        ));
  }

  FutureBuilder<String> _buildFutureBuilderAnserlist(Katalog katalog) {
    String udid = DataModel.store.leihausweis.udid;
    return FutureBuilder(
      future: cm.reservierungListUdid(udid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.none &&
            snapshot.hasData == null) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container();
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        } else {
          String json = snapshot.data as String;
          List<Answer> liste = answerFromJson(json);
          return Container(
            child: (ListView.builder(
              itemCount: liste.length,
              itemBuilder: (context, index) {
                Answer a = liste[index];
                //return _createContent(context, e);
                Eintrag e =
                    katalog.getEintrayByInventarnummer(a.inventarnummer);
                return ProductCardWidget(
                  e,
                  callback: () {},
                  showButton: false,
                );
              },
            )),
          );
        }
      },
    );
  }
}
