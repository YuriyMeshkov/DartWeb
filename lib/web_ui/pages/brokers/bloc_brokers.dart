import 'package:alim_freight_app/web_ui/pages/brokers/data/brokers_repository.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/brokers.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/transactionbroker.dart';
import 'package:rxdart/rxdart.dart';
import 'data/model/brokersmapper.dart';

class BlockBrokers {

  BrokersRepository _brokersRepository = BrokersRepositoryImpl();

  final _brokersController = BehaviorSubject<List<Broker>>();

  Stream<List<Broker>> get currentBrokers => _brokersController.stream;

  void getBrokersFromServer() async {
    List<TransactionBroker> result = await _brokersRepository.getBrokersFromServer();
    _brokersController.add(BrokersMapper().map(result));
  }

  void updateBrokerOnServer(Broker broker) async {
    TransactionBroker transactionBroker = TransactionBrokersMapper().map(broker);
    bool save = await _brokersRepository.updateBrokerOnServer(transactionBroker);
    if(save) getBrokersFromServer();
  }

  void addBrokerToServer(Broker broker) async {
    TransactionBroker transactionBroker = TransactionBrokersMapper().map(broker);
    bool save = await _brokersRepository.addBrokerToServer(transactionBroker);
    if(save) getBrokersFromServer();
  }

  void dispose() {
    _brokersController.close();
  }

}