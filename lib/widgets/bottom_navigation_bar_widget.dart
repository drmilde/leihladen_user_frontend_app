import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/abholen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/ausleihen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/auswaehlen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/mitmachen_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  int _currentIndex = 0;

  BottomNavigationBarWidget(this._currentIndex);

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: widget._currentIndex,
      onTap: (int index) {
        setState(() {
          widget._currentIndex = index;
           if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return AuswaehlenScreen();
            }));
          }
          if (index == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return AusleihenScreen();
            }));
          }
          if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return AbholenScreen();
            }));
          }

          if (index == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return MitmachenScreen();
            }));
          }
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.store),
          title: Text("Auswählen"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_run),
          title: Text("Ausleihen"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Abholen"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          title: Text("Mitmachen"),
        ),
      ],
    );
  }
}
