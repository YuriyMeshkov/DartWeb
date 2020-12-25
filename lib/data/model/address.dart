import 'package:alim_freight_app/data/model/data_model_app.dart';

class Address implements DataModelApp{

  String idDocument;
  String postalCode;
  String stateProvince;
  String cityName;
  String country;
  String streetNameAndNumber;

  Address(
      {
        this.idDocument = "",
        this.postalCode = "",
        this.stateProvince = "",
        this.cityName = "",
        this.country = "",
        this.streetNameAndNumber = "",
      }
  );
}