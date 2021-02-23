import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatelessWidget {
  String data = "kein Leihausweis";

  QrCodeScreen(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ihr Leihausweis"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32,
              ),
              Container(
                child: Text(data),
              ),
              SizedBox(
                height: 32,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Container(
                      child: QrImage(
                        data: data,
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width * 0.8,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
