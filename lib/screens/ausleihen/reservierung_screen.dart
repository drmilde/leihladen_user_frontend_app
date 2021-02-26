import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/messaging/answer.dart';
import 'package:leihladen_user_frontend_app/messaging/communication.dart';
import 'package:leihladen_user_frontend_app/model/katalog.dart';
import 'package:leihladen_user_frontend_app/widgets/product_card_widget.dart';

class ReservierungScreen extends StatelessWidget {
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
    return FutureBuilder(
      future: cm.reservierungListAll(),
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
