import 'package:leihladen_user_frontend_app/config/store.dart';

class DataModel {
  static Store store;

  DataModel() {
    // TODO Initialisierung
    store = Store(
        stand: "24.05.2021",
        version: "1.0",
        leihausweis: Leihausweis(),
        warenkorb: Warenkorb());
  }
}
