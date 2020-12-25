import 'dart:convert';
import 'package:alim_freight_app/data/repository.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/transactionbroker.dart';
import 'package:appwrite/appwrite.dart';

import '../../../../main.dart';

abstract class BrokersRepository implements Repository {
  Future <List<TransactionBroker>> getBrokersFromServer();
  Future<bool> addBrokerToServer(TransactionBroker transactionBroker);
  Future<bool> updateBrokerOnServer(TransactionBroker transactionBroker);
}

class BrokersRepositoryImpl implements BrokersRepository  {

  final String collectionIdBroker = "5f29c5e3c824a";
  final String collectionAddress = "5f57c69be92c6";

  @override
  Future <List<TransactionBroker>> getBrokersFromServer() async {
    try {
      Response response = await database
          .listDocuments(collectionId: collectionIdBroker);
      if(response.statusCode == 200) {
        return List<TransactionBroker>.from(response.data['documents']
            .map((tr) => TransactionBroker.fromJson(tr)));
      } else {
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  @override
  Future<bool> addBrokerToServer(TransactionBroker transactionBroker) async {
    try {
      var tran = jsonEncode(transactionBroker.toJson());
      Response resultBroker = await database.createDocument(
          collectionId: collectionIdBroker,
          data: transactionBroker.toJson(),
          read: ['*'],
          write: ['*']);

      TransactionBroker parentDocument = TransactionBroker.fromJson(resultBroker.data);
      var tran2 = jsonEncode(transactionBroker.address.toJson());
      Response resultAddress = await database.createDocument(
          collectionId: collectionAddress,
          data: transactionBroker.address.toJson(),
          read: ['*'],
          write: ['*'],
          parentDocument: parentDocument.idDocument,
          parentProperty: "address",
          parentPropertyType: 'assign');
      return true;
    } catch (e) {
      return false;
    }

  }

  @override
  Future<bool> updateBrokerOnServer(TransactionBroker transactionBroker) async {
    try {
      await database.updateDocument(
          collectionId: collectionIdBroker,
          documentId: transactionBroker.idDocument,
          data: transactionBroker.toJson(),
          read: ['*'],
          write: ['*']);

      await database.updateDocument(
          collectionId: collectionAddress,
          documentId: transactionBroker.address.idDocument,
          data: transactionBroker.address.toJson(),
          read: ['*'],
          write: ['*']);
      return true;
    } catch (e) {
      return false;
    }
  }
}