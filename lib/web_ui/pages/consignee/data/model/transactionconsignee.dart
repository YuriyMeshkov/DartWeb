import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/data/model/permission.dart';
import 'package:alim_freight_app/data/model/transactionaddress.dart';

class TransactionConsignee  extends TransactionApp{
  String idDocument;
  String collection;
  Permissions permissions;
  String userId;
  String idConsignee;
  String phone;
  String nameOfConsignee;
  String email;


  TransactionAddress address;

  TransactionConsignee({
    this.idDocument,
    this.collection,
    this.permissions,
    this.userId,
    this.idConsignee,
    this.phone,
    this.nameOfConsignee,
    this.email,
    this.address
  });

  TransactionConsignee.fromJson(Map<String, dynamic> json) {
    idDocument = json['\$id'];
    collection = json['\$collection'];
    /*permissions = json['$permissions'] != null
        ? new Permissions.fromJson(json['$permissions'])
        : null;*/
    userId = json['user_id'];
    phone = json['phone'];
    nameOfConsignee = json['name_of_consignee'];
    email = json['email'];
    address = json['address'] != null
        ? TransactionAddress.fromJson(json["address"]) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    /*data['$id'] = this.id;
    data['$collection'] = this.collection;
    data['$permissions'] = this.permissions.toJson();*/
    /*if(this.permissions != null) {
      data['$permissions'] = this.permissions.toJson();
    }*/
    data['user_id'] = this.userId;
    data['id_consignee'] = this.idConsignee;
    data['phone'] = this.phone;
    data['name_of_consignee'] = this.nameOfConsignee;
    data['email'] = this.email;

    //data['address'] = this.address.toJson();
    return data;
  }
}
