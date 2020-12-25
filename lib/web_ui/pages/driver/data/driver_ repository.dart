import 'package:alim_freight_app/web_ui/pages/driver/data/model/driver.dart';

import '../../../../data/repository.dart';

abstract class DriverRepository implements Repository {
  List<Driver> getDriversFromServer();
  void addDriverToServer(Driver driver);
}