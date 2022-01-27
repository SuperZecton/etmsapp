import 'package:unique_identifier/unique_identifier.dart';

class DeviceUUID {
  DeviceUUID();

  Future<String> getUUID() async {
    var identifier = await UniqueIdentifier.serial;
    if (identifier != null) {
      return identifier;
    } else {
      throw Exception;
    }
  }
}
