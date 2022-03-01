import 'package:crypt/crypt.dart';
class Hash{
  Hash();
  String getHash(String password){
    var hash = Crypt.sha256(password, salt: 'AoahAoSalakau');
    return hash.toString();
  }
}