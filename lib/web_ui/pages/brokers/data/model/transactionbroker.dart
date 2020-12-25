import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/data/model/permission.dart';
import 'package:alim_freight_app/data/model/transactionaddress.dart';

class TransactionBroker  extends TransactionApp{
  String idDocument;
  String collection;
  Permissions permissions;
  String userId;
  String idBroker;
  String phone;
  String nameOfBroker;
  String email;
  String apEmail;
  String paymentTerm;
  String paymentOptions;
  TransactionAddress address;

  TransactionBroker({
    this.idDocument,
    this.collection,
    this.permissions,
    this.userId,
    this.idBroker,
    this.phone,
    this.nameOfBroker,
    this.email,
    this.apEmail,
    this.paymentTerm,
    this.paymentOptions,
    this.address
  });

  TransactionBroker.fromJson(Map<String, dynamic> json) {
    idDocument = json['\$id'];
    collection = json['\$collection'];
    /*permissions = json['$permissions'] != null
        ? new Permissions.fromJson(json['$permissions'])
        : null;*/
    userId = json['user_id'];
    idBroker = json['id_broker'];
    phone = json['phone'];
    nameOfBroker = json['name_of_broker'];
    email = json['email'];
    apEmail = json['ap_email'];
    paymentTerm = json['payment_term'];
    paymentOptions = json['payment_options'];
    address = json['address'] != null
        ? TransactionAddress.fromJson(json["address"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['\$id'] = this.idDocument;
    /*data['$collection'] = this.collection;
    data['$permissions'] = this.permissions.toJson();*/
    /*if(this.permissions != null) {
      data['$permissions'] = this.permissions.toJson();
    }*/
    data['user_id'] = this.userId;
    data['id_broker'] = this.idBroker;
    data['phone'] = this.phone;
    data['name_of_broker'] = this.nameOfBroker;
    data['email'] = this.email;
    data['ap_email'] = this.apEmail;
    data['payment_term'] = this.paymentTerm;
    data['payment_options'] = this.paymentOptions;
    //data['address'] = this.address.toJson();
    return data;
  }
}



