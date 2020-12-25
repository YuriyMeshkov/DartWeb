import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/data/model/address.dart';
import 'package:uuid/uuid.dart';

class Broker implements DataModelApp {
  String idDocument;
  String nameOfBroker;
  Address address;
  String phone;
  String email;
  String apEmail;
  String paymentTerm;
  String paymentOptions;
  String idBroker;

  Broker(
      {
        this.idDocument = "",
        this.nameOfBroker = "",
        this.phone = "",
        this.email = "",
        this.apEmail = "",
        this.paymentTerm = "",
        this.paymentOptions = "",
        String idBroker,
        Address address,
      }
  ) : address = Address(), idBroker = Uuid().v4();
}

