import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/web_ui/pages/consignee/data/model/consignee.dart';
import 'package:alim_freight_app/web_ui/pages/customs_broker/data/model/customs_broker.dart';
import 'package:alim_freight_app/web_ui/pages/shipper/data/model/shipper.dart';



class LoadsInfo implements DataModelApp {
  int loadConfirmationID;
  DateTime pickUpDate;
  Shipper shipper;
  DateTime deliveryDate;
  Consignee consignee;
  int pieces;
  Weight weight;
  String description;
  Rate rate;
  CustomsBroker customsBroker;
  String notices;
  String deliveryInstruction;
  String accessory;

}



class Rate {
  double usd;
  double cad;

  Rate({this.usd, this.cad});
}




class Weight {
  int pounds;
  int kilos;

  Weight({this.pounds, this.kilos});


}