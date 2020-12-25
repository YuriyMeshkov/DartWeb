import 'package:alim_freight_app/data/repository.dart';
import 'package:alim_freight_app/web_ui/pages/trips/data/model/info_trips.dart';

abstract class TripsRepository implements Repository{
  List<Trip> getTripsFromServer();
  void addTripToServer(Trip trip);
}