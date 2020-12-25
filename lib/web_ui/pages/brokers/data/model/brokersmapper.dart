import 'package:alim_freight_app/data/model/addressesmapper.dart';
import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/main.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/transactionbroker.dart';

import 'brokers.dart';

class BrokersMapper implements MapperApp<List<TransactionBroker>, List<BrokersMapper>> {
  @override
  List<Broker> map(List<TransactionBroker> from) {
    var brokers = List<Broker>();
    from.forEach((element) {
      var broker = Broker(
        idDocument: element.idDocument,
        idBroker: element.idBroker,
        phone: element.phone,
        nameOfBroker: element.nameOfBroker,
        email: element.email,
        apEmail: element.apEmail,
        paymentTerm: element.paymentTerm,
        paymentOptions: element.paymentOptions,
      );
      broker.address = AddressesMapper().map(element.address);
      brokers.add(broker);
    });
    return brokers;
  }



}

class TransactionBrokersMapper implements MapperApp<Broker, TransactionBroker> {
  @override
  TransactionBroker map(Broker from) {
      var transaction =  TransactionBroker(
        idDocument: from.idDocument,
        userId: userIdAppWrite,
        idBroker: from.idBroker,
        phone: from.phone,
        nameOfBroker: from.nameOfBroker,
        email: from.email,
        apEmail: from.apEmail,
        paymentTerm: from.paymentTerm,
        paymentOptions: from.paymentOptions
      );
      transaction.address = TransactionAddressesMapper().map(from.address);
      return transaction;
  }



}