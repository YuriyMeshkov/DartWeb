import 'package:alim_freight_app/auth/authtemporary.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/bloc_brokers.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

extension InitializeServices on GetIt {
  void initializeServices() {
    registerSingleton<BlockBrokers>(BlockBrokers());
  }
}
