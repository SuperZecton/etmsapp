import 'package:crypto/crypto.dart';
import 'dart:convert';
class Hash{
  Hash();
  String getHash(String password){
    var hash;
    if (password.length == 64){
      hash = password;
    }
    else{
      var encodePassword = utf8.encode(password);
      hash = sha256.convert(encodePassword);
    }
    return hash.toString();
  }
}