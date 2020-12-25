import 'package:alim_freight_app/data/model/address.dart';
import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/data/model/transactionaddress.dart';
import 'package:alim_freight_app/main.dart';
import 'package:alim_freight_app/web_ui/pages/consignee/data/model/consignee.dart';
import 'package:alim_freight_app/web_ui/pages/consignee/data/model/transactionconsignee.dart';


class ConsigneeMapper implements MapperApp<List<TransactionConsignee>, List<ConsigneeMapper>> {
  @override
  List<Consignee> map(List<TransactionConsignee> from) {
    var consignees = List<Consignee>();
    from.forEach((element) {
      var consignee = Consignee(
        idDocument: element.idDocument,
        idConsignee: element.idConsignee,
        phone: element.phone,
        nameOfConsignee: element.nameOfConsignee,
        email: element.email,

      );
      consignee.address = getAddress(element.address);
      consignees.add(consignee);
    });
    return consignees;
  }

  Address getAddress(TransactionAddress transactionAddress) {
    if(transactionAddress != null) {
      return Address(
          postalCode: transactionAddress.postalCode,
          stateProvince: transactionAddress.stateProvince,
          cityName: transactionAddress.cityName,
          country: transactionAddress.country,
          streetNameAndNumber: transactionAddress.streetNameAndNumber
      );
    } else {
      return Address(
          postalCode: "",
          stateProvince: "",
          cityName: "",
          country: "",
          streetNameAndNumber: ""
      );
    }
  }

}

class TransactionMapper implements MapperApp<Consignee, TransactionConsignee> {
  @override
  TransactionConsignee map(Consignee from) {
    var transaction =  TransactionConsignee(
        userId: userIdAppWrite,
        idConsignee: from.idConsignee,
        phone: from.phone,
        nameOfConsignee: from.nameOfConsignee,
        email: from.email,

    );
    transaction.address = getAddress(from.address);
    return transaction;
  }

  TransactionAddress getAddress(Address address) {
    if(address != null) {
      return TransactionAddress(
          postalCode: address.postalCode,
          stateProvince: address.stateProvince,
          cityName: address.cityName,
          country: address.country,
          streetNameAndNumber: address.streetNameAndNumber
      );
    } else {
      return TransactionAddress(
          postalCode: "",
          stateProvince: "",
          cityName: "",
          country: "",
          streetNameAndNumber: ""
      );
    }
  }

}