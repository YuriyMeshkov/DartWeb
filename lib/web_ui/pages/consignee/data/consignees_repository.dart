
import 'package:alim_freight_app/data/repository.dart';
import 'package:alim_freight_app/web_ui/pages/brokers/data/model/transactionbroker.dart';
import 'package:alim_freight_app/web_ui/pages/consignee/data/model/transactionconsignee.dart';
import 'package:appwrite/appwrite.dart';
import 'package:alim_freight_app/main.dart';

abstract class ConsigneesRepository implements Repository {
  Future <List<TransactionConsignee>> getBrokersFromServer();
  Future<bool> addBrokerToServer(TransactionConsignee transactionConsignee);
  Future<bool> updateBrokerOnServer(TransactionConsignee transactionConsignee);
}

class ConsigneesRepositoryImpl implements ConsigneesRepository {

  final String collectionIdConsignee = "5f29c5e3c824a";
  final String collectionAddress = "5f57c69be92c6";

  @override
  Future <List<TransactionConsignee>> getBrokersFromServer() async {
    try {
      Response response = await database
          .listDocuments(collectionId: collectionIdConsignee);
      if (response.statusCode == 200) {
        return List<TransactionConsignee>.from(response.data['documents']
            .map((tr) => TransactionConsignee.fromJson(tr)));
      } else {
        return null;
      }
    } catch (e) {
      print(e.message);
      return null;
    }
  }

  @override
  Future<bool> addBrokerToServer(TransactionConsignee transactionConsignee) async {
    try {
      Response resultBroker = await database.createDocument(
          collectionId: collectionIdConsignee,
          data: transactionConsignee.toJson(),
          read: ['*'],
          write: ['*']);

      TransactionBroker parentDocument = TransactionBroker.fromJson(
          resultBroker.data);
       await database.createDocument(
          collectionId: collectionAddress,
          data: transactionConsignee.address.toJson(),
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
  Future<bool> updateBrokerOnServer(TransactionConsignee transactionConsignee) async {
    try {
      await database.updateDocument(
          collectionId: collectionIdConsignee,
          documentId: transactionConsignee.idDocument,
          data: transactionConsignee.toJson(),
          read: ['*'],
          write: ['*']);

      await database.updateDocument(
          collectionId: collectionAddress,
          documentId: transactionConsignee.address.idDocument,
          data: transactionConsignee.address.toJson(),
          read: ['*'],
          write: ['*']);
      return true;
    } catch (e) {
      return false;
    }
  }
}