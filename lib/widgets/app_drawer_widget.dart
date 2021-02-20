import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/entliehen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/leihausweis_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/reservierung_screen.dart';
import 'package:leihladen_user_frontend_app/screens/ausleihen/warenkorb_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/mitmachen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/info/impressum_screen.dart';
import 'package:leihladen_user_frontend_app/screens/info/info_screen.dart';
import 'package:leihladen_user_frontend_app/screens/info/system_info_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_entry_widget.dart';

class AppDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Jan-Torsten Milde"),
              accountEmail: Text("Lauterbach"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Text(
                  "JT",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            /*
            AppDrawerEntryWidget("Einführung in die App",
                "assets/images/symbol/info_symbol.png", MitmachenScreen()),
             */
            AppDrawerEntryWidget(
              "Informationen zum Bürgerzentrum",
              "assets/images/symbol/home_symbol.png",
              InfoScreen(),
              replace: false,
            ),
            Divider(thickness: 2),
            AppDrawerEntryWidget(
              "Ihr Leihausweis",
              "assets/images/symbol/leihausweis_symbol.png",
              LeihausweisScreen(),
              replace: false,
            ),
            AppDrawerEntryWidget(
              "Ihr Warenkorb",
              "assets/images/symbol/warenkorb_symbol.png",
              WarenkorbScreen(),
              replace: false,
            ),
            AppDrawerEntryWidget(
              "Ihre Reservierung",
              "assets/images/symbol/order_symbol.png",
              ReservierungScreen(),
              replace: false,
            ),
            AppDrawerEntryWidget(
              "Von Ihnen entliehen",
              "assets/images/symbol/entliehen_symbol.png",
              EntliehenScreen(),
              replace: false,
            ),
            Divider(thickness: 2),
            //AppDrawerEntryWidget("Administrator",  "assets/images/symbol/info_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget(
              "Systeminformation",
              "assets/images/symbol/system_symbol.png",
              SystemInfoScreen(),
              replace: false,
            ),
            Divider(thickness: 2),
            AppDrawerEntryWidget(
              "Impressum & Datenschutz",
              "assets/images/symbol/info_symbol.png",
              ImpressumScreen(),
              replace: false,
            ),
          ],
        ),
      )),
    );
  }
}
