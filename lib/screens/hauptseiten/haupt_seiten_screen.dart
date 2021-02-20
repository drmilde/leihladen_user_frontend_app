import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/abholen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/ausleihen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/auswaehlen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/mitmachen_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';

class HauptSeitenScreen extends StatefulWidget {
  _HauptSeitenScreenState _state;

  @override
  _HauptSeitenScreenState createState() {
    _state =  _HauptSeitenScreenState();
    return _state;
  }

  void setSelectedScreen (int screen) {
    _state.setSelectedScreen(screen);
  }
}

class _HauptSeitenScreenState extends State<HauptSeitenScreen> {
  List<Widget> content = [
    AuswaehlenScreen(),
    AusleihenScreen(),
    AbholenScreen(),
    MitmachenScreen()
  ];

  List<String> titles = [
    "Auswählen",
    "Ausleihen",
    "Abholen",
    "Mitmachen",
  ];

  int _selectedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedScreen]),
      ),
      body: content[_selectedScreen],
      bottomNavigationBar: BottomNavigationBarWidget(_selectedScreen, widget),
    );
  }

  void setSelectedScreen (int screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }
}
