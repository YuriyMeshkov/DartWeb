import 'package:alim_freight_app/data/model/address.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/brokers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrokerAdd extends StatefulWidget {
  final Broker broker;
  BrokerAdd(this.broker);

  @override
  _BrokerAdd createState() => _BrokerAdd(broker: broker);
}

class _BrokerAdd extends State<BrokerAdd> {


  Broker _broker;
  Address _address;
  bool _isEditBroker = false; //пременная определяющая это редактирование или добаление

  _BrokerAdd({@required Broker broker}) {
    if(broker == null) {
      _broker = Broker();
      _address = Address();
    } else {
      _broker = broker;
      _address = broker.address;
      _isEditBroker = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    var controllerName = TextEditingController(text: _broker.nameOfBroker);
    var controllerPhone = TextEditingController(text: _broker.phone);
    var controllerEmail = TextEditingController(text: _broker.email);
    var controllerApEmail = TextEditingController(text: _broker.apEmail);
    var controllerPayTerm = TextEditingController(text: _broker.paymentTerm);
    var controllerPayOptions = TextEditingController(text: _broker.paymentOptions);
    var controllerPostalCode = TextEditingController(text: _broker.address.postalCode);
    var controllerStateProvince = TextEditingController(text: _broker.address.stateProvince);
    var controllerCityName = TextEditingController(text: _broker.address.cityName);
    var controllerCountry = TextEditingController(text: _broker.address.country);
    var controllerStreetNameAndNumber = TextEditingController(text: _broker.address.streetNameAndNumber);
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 620),
        child: Container(
          color: Colors.blue,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add Broker',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 2,
                        child: Row(
                          children: [
                            Text(
                              'Broker name',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerName,
                                onChanged: (text) {
                                  _broker.nameOfBroker = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "broker name",
                          ),*/
                              ),
                            ),
                            SizedBox(width: screenSize.width / 20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'Phone',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerPhone,
                                onChanged: (text) {
                                  _broker.phone = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "phone",
                          ),*/
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 2,
                        child: Row(
                          children: [
                            Text(
                              'email',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerEmail,
                                onChanged: (text) {
                                  _broker.email = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "broker name",
                          ),*/
                              ),
                            ),
                            SizedBox(width: screenSize.width / 20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'ap email',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerApEmail,
                                onChanged: (text) {
                                  _broker.apEmail = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "phone",
                          ),*/
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: screenSize.width / 2,
                        child: Row(
                          children: [
                            Text(
                              'payment term',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerPayTerm,
                                onChanged: (text) {
                                  _broker.paymentTerm = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "broker name",
                          ),*/
                              ),
                            ),
                            SizedBox(width: screenSize.width / 20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              'payment options',
                              style: TextStyle(color: Colors.blue),
                            ),
                            SizedBox(width: screenSize.width / 50),
                            Expanded(
                              child: TextField(
                                controller: controllerPayOptions,
                                onChanged: (text) {
                                  _broker.paymentOptions = text;
                                },
                                /*decoration: InputDecoration(
                            hintText: "phone",
                          ),*/
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 0, top: 60, right: 20, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Address:',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenSize.width / 3,
                    child: Row(
                      children: [
                        Text(
                          'postal code',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        Expanded(
                          child: TextField(
                            controller: controllerPostalCode,
                            onChanged: (text) {
                              _address.postalCode = text;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenSize.width / 3,
                    child: Row(
                      children: [
                        Text(
                          'state and province',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        Expanded(
                          child: TextField(
                            controller: controllerStateProvince,
                            onChanged: (text) {
                              _address.stateProvince = text;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenSize.width / 3,
                    child: Row(
                      children: [
                        Text(
                          'city',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        Expanded(
                          child: TextField(
                            controller: controllerCityName,
                            onChanged: (text) {
                              _address.cityName = text;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenSize.width / 3,
                    child: Row(
                      children: [
                        Text(
                          'country',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        Expanded(
                          child: TextField(
                            controller: controllerCountry,
                            onChanged: (text) {
                              _address.country = text;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenSize.width / 3,
                    child: Row(
                      children: [
                        Text(
                          'street',
                          style: TextStyle(color: Colors.blue),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        Expanded(
                          child: TextField(
                            controller: controllerStreetNameAndNumber,
                            onChanged: (text) {
                              _address.streetNameAndNumber = text;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(60),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _newOrEditBroker(_broker),
                          child: Container(
                            width: 100,
                            height: 40,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                _isEditBroker ? "Update" : "Add",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: screenSize.width / 50),
                        InkWell(
                          onTap: () => _newOrEditBroker(null),
                          child: Container(
                            width: 100,
                            height: 40,
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _newOrEditBroker(Broker broker) {
    if(broker != null) {
      broker.address = _address;
    }
    Navigator.pop(context, broker);
  }
}
