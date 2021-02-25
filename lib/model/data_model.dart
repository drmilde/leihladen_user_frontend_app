import 'package:leihladen_user_frontend_app/config/persistence.dart';
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

  static void loadStore() {
    Persistence.load().then((String result){
      store = storeFromJson(result);
    });
  }

  static void saveStore() {
    Persistence.store(storeToJson(store));
  }
}
