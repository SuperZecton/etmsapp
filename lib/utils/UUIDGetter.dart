import 'package:unique_identifier/unique_identifier.dart';
class deviceUUID {
  deviceUUID();

  Future<String> getUUID() async{
    var identifier = UniqueIdentifier.serial;
    return (identifier as String);
  }
}