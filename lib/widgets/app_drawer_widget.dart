import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/mitmachen_screen.dart';
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
            AppDrawerEntryWidget("Einführung in die App",
                "assets/images/symbol/info_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget("Informationen zum Bürgerzentrum",
                "assets/images/symbol/home_symbol.png", MitmachenScreen()),
            Divider(thickness: 2),
            AppDrawerEntryWidget("Ihr Leihausweis",
                "assets/images/symbol/leihausweis_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget("Ihr Warenkorb",
                "assets/images/symbol/warenkorb_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget("Ihre Reservierung",
                "assets/images/symbol/order_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget("Von Ihnen entliehen",
                "assets/images/symbol/entliehen_symbol.png", MitmachenScreen()),
            Divider(thickness: 2),
            //AppDrawerEntryWidget("Administrator",  "assets/images/symbol/info_symbol.png", MitmachenScreen()),
            AppDrawerEntryWidget("Systeminformation",
                "assets/images/symbol/system_symbol.png", MitmachenScreen()),
            Divider(thickness: 2),
            AppDrawerEntryWidget("Impressum & Datenschutz",
                "assets/images/symbol/info_symbol.png", MitmachenScreen()),
          ],
        ),
      )),
    );
  }
}
