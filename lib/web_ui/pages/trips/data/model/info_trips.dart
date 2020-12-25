import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/web_ui/pages/trailer/data/model/trailer.dart';
import 'package:alim_freight_app/web_ui/pages/vehicle/data/model/vehicle.dart';

class Trip implements DataModelApp{

  TripNumber tripNumber;
  int idDriver;
  Vehicle truck;
  Trailer trailer;
  PapsPars papsPars;

  Trip({this.tripNumber, this.idDriver, this.truck, this.trailer, this.papsPars});
}

class PapsPars {
  String paps;
  String pars;

  PapsPars({this.paps, this.pars});
}

class TripNumber {

  int tripNumber;

  TripNumber({this.tripNumber});

  // generateTripNumber();
}

