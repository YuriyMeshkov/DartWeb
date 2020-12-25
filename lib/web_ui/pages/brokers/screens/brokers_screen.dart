import 'package:alim_freight_app/web_ui/pages/brokers/bloc_brokers.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/brokers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:alim_freight_app/locators/locator.dart';
import 'broker_add_screen.dart';

class BrokersScreen extends StatefulWidget {
  @override
  _BrokersScreen createState() => _BrokersScreen();
}

class _BrokersScreen extends State<BrokersScreen> {

  var _brokers = List<Broker>();
  var _streamBrokers = getIt<BlockBrokers>().currentBrokers;

  @override
  void initState() {
    super.initState();
    getIt<BlockBrokers>().getBrokersFromServer();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, 1000),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Brokers',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          child: StreamBuilder<List<Broker>>(
            initialData: _brokers,
            stream: _streamBrokers,
            builder: (context, snapshot) {
              if(!snapshot.hasError) {
                _brokers = snapshot.data;
              }
              return ListView.builder(
                itemCount: _brokers == null ? 0 : _brokers.length,
                itemBuilder: (BuildContext context, int index) {
                  return BrokerData(_brokers[index], _screenSize);
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addBroker(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addBroker(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrokerAdd(null),
      ),
    );
    if(result != null) {
      Broker broker = result;
      broker.idBroker = _getId;
      getIt<BlockBrokers>().addBrokerToServer(broker);
    }
  }

  String get _getId {
    var uuid = Uuid();
    var findId = false;
    String answerId;
    do {
      findId = true;
      answerId = uuid.v4();
      _brokers.forEach((element) {
        if(answerId == element.idBroker) {
          findId = false;
        }
      });
    } while(!findId);
    return answerId;
  }
}

class BrokerData extends StatelessWidget {
  final Broker _broker;
  final Size _screenSize;

  BrokerData(this._broker, this._screenSize);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _loadingBroker(context),
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_broker.nameOfBroker ),
              SizedBox(width: _screenSize.width / 20),
              Text(
                  _broker.email,
              ),
              SizedBox(width: _screenSize.width / 20),
              Text(
                _broker.phone,
              ),
              SizedBox(width: _screenSize.width / 20),
              Expanded(
                child: Text(
                  _broker.address.postalCode + ", " +
                  _broker.address.stateProvince + ", " +
                  _broker.address.cityName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadingBroker(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BrokerAdd(_broker),
      ),
    );
    if(result != null) {
      getIt<BlockBrokers>().updateBrokerOnServer(result);
    }
  }
}
