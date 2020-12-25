abstract class DataModelApp {}
abstract class TransactionApp{}
abstract class MapperApp<From, To> {
  map(From from) => To;
}
