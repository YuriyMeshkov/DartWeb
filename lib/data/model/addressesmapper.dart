import 'package:alim_freight_app/data/model/data_model_app.dart';
import 'package:alim_freight_app/data/model/transactionaddress.dart';
import 'address.dart';

class AddressesMapper implements MapperApp<TransactionAddress, Address> {
  @override
  Address map(TransactionAddress from) {
    if(from != null) {
      return Address(
          idDocument: from.idDocument,
          postalCode: from.postalCode,
          stateProvince: from.stateProvince,
          cityName: from.cityName,
          country: from.country,
          streetNameAndNumber: from.streetNameAndNumber
      );
    } else {
      return Address();
    }
  }
}

class TransactionAddressesMapper
    implements MapperApp<Address, TransactionAddress> {
  @override
  TransactionAddress map(Address from) {
    if(from != null) {
      return TransactionAddress(
          idDocument: from.idDocument,
          postalCode: from.postalCode,
          stateProvince: from.stateProvince,
          cityName: from.cityName,
          country: from.country,
          streetNameAndNumber: from.streetNameAndNumber
      );
    } else {
      return TransactionAddress(
          idDocument: "",
          postalCode: "",
          stateProvince: "",
          cityName: "",
          country: "",
          streetNameAndNumber: ""
      );
    }
  }
}
