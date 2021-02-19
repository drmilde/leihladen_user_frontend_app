import 'package:flutter/material.dart';

import 'hauptseiten/auswaehlen_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StartScreen"),
      ),
      body: GestureDetector(
        onTap: () {
          // Weiter zu nächsten Seite
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AuswaehlenScreen();
          }));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 70,
                  child: Placeholder(),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Zum Starten, den Bildschirm berühren")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
