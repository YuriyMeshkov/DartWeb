import 'package:alim_freight_app/data/model/permission.dart';

class TransactionAddress {
  String idDocument;
  String collection;
  Permissions permissions;
  String postalCode;
  String stateProvince;
  String cityName;
  String country;
  String streetNameAndNumber;

  TransactionAddress({
    this.idDocument,
    this.collection,
    this.permissions,
    this.postalCode,
    this.stateProvince,
    this.cityName,
    this.country,
    this.streetNameAndNumber
  });

  TransactionAddress.fromJson(Map<String, dynamic> json) {
    idDocument = json['\$id'];
    collection = json['\$collection'];
    /*permissions = json['$permissions'] != null
        ? new Permissions.fromJson(json['$permissions'])
        : null;*/
    postalCode = json['postal_code'];
    stateProvince = json['state_province'];
    cityName = json['city_name'];
    country = json['country'];
    streetNameAndNumber = json['street_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['\$id'] = this.idDocument;
    /*data['$collection'] = this.collection;
    if(this.permissions != null) {
      data['$permissions'] = this.permissions.toJson();
    }*/
    data['postal_code'] = this.postalCode;
    data['state_province'] = this.stateProvince;
    data['city_name'] = this.cityName;
    data['country'] = this.country;
    data['street_number'] = this.streetNameAndNumber;
    return data;
  }
}