// Bot Token 5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

class TelebotConnector {
  TelebotConnector();

  Future<void> sendMovement(String vehicleNo, String locationEnd, String purposeOfTrip, String toRank, String toFullName, String vcRankFullName, String additionalPlate) async {
    var botToken = "5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg";
    var username = (await Telegram(botToken).getMe()).username;
    var teledart = TeleDart(botToken, Event(username!));
    teledart.start();
    if (additionalPlate != ""){
      vehicleNo = vehicleNo + " / " + additionalPlate;
    }
    if (vcRankFullName == ""){
      teledart.sendMessage('-1001585228215', "BOS & CT/JIT DONE\nMID" + vehicleNo + " moving to " + locationEnd + " for " + purposeOfTrip + "\nTO: " + toRank + " " + toFullName);
    }
    else{
      teledart.sendMessage('-1001585228215', "BOS & CT/JIT DONE\nMID" + vehicleNo + " moving to " + locationEnd + " for " + purposeOfTrip + "\nTO: " + toRank + " " + toFullName + "\nVC: " + vcRankFullName);
    }
    teledart.stop();
  }

  Future<void> endMovement(String vehicleNo, String locationEnd, String toRank, String toFullName, String vcRankFullName, String additionalPlate) async {
    var botToken = "5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg";
    var username = (await Telegram(botToken).getMe()).username;
    var teledart = TeleDart(botToken, Event(username!));
    teledart.start();
    if (additionalPlate != ""){
      vehicleNo = vehicleNo + " / " + additionalPlate;
    }
    if (vcRankFullName == ""){
      teledart.sendMessage('-1001585228215', "BOS & CT/JIT DONE\nMID" + vehicleNo + " arrived at " + locationEnd + "\nTO: " + toRank + " " + toFullName);
    }
    else{
      teledart.sendMessage('-1001585228215', "BOS & CT/JIT DONE\nMID" + vehicleNo + " arrived at " + locationEnd + "\nTO: " + toRank + " " + toFullName + "\nVC: " + vcRankFullName);
    }
    teledart.stop();
  }
}