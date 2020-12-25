import 'package:alim_freight_app/data/model/address.dart';
import 'package:uuid/uuid.dart';

class Consignee {
  String idDocument;
  String nameOfConsignee;
  Address address;
  String phone;
  String email;
  String idConsignee;

  Consignee(
  {
    this.idDocument = "",
    this.nameOfConsignee = "",
    this.phone = "",
    this.email = "",
    String idConsignee,
    Address address,
  }
  ) : address = Address(), idConsignee = Uuid().v4();
}