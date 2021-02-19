import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'hauptseiten/auswaehlen_screen.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Der Leihladen in Fulda"),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/logos/logo_buergerzentrum_haus_klein.png"),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/logos/awo_logo.png"),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: Image.asset("assets/images/logos/ll_neues_logo.png"),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/logos/logo_weiss_stadtfulda_klein.jpg"),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Image.asset("assets/images/logos/dpl_logo_512.jpg"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
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
