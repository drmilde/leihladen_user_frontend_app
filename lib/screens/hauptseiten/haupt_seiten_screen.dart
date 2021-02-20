import 'package:flutter/material.dart';
import 'package:leihladen_user_frontend_app/config/color_config.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/abholen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/ausleihen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/auswaehlen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/hauptseiten/mitmachen_screen.dart';
import 'package:leihladen_user_frontend_app/screens/info/info_screen.dart';
import 'package:leihladen_user_frontend_app/widgets/app_drawer_widget.dart';
import 'package:leihladen_user_frontend_app/widgets/bottom_navigation_bar_widget.dart';

class HauptSeitenScreen extends StatefulWidget {
  _HauptSeitenScreenState _state;

  @override
  _HauptSeitenScreenState createState() {
    _state = _HauptSeitenScreenState();
    return _state;
  }

  void setSelectedScreen(int screen) {
    _state.setSelectedScreen(screen);
  }
}

class _HauptSeitenScreenState extends State<HauptSeitenScreen> {
  int _selectedScreen = 0;
  List<Widget> content;
  List<FloatingActionButton> floatActionButtons;
  List<String> titles;

  @override
  void initState() {
    initPages();
    super.initState();
  }

  void initPages() {
    content = [
      AuswaehlenScreen(),
      AusleihenScreen(),
      AbholenScreen(),
      MitmachenScreen()
    ];

    floatActionButtons = [
      null,
      null,
      null,
      null,
    ];

    titles = [
      "Auswählen",
      "Ausleihen",
      "Abholen",
      "Mitmachen",
    ];
  }

  @override
  Widget build(BuildContext context) {
    floatActionButtons[2] = FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => InfoScreen()));
      },
      child: Text("Info", style: TextStyle(color: Colors.white)),
      backgroundColor: Theme.of(context).primaryColorDark,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedScreen]),
      ),
      body: content[_selectedScreen],
      bottomNavigationBar: BottomNavigationBarWidget(_selectedScreen, widget),
      drawer: AppDrawerWidget(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatActionButtons[_selectedScreen],
    );
  }

  void setSelectedScreen(int screen) {
    setState(() {
      _selectedScreen = screen;
    });
  }
}
