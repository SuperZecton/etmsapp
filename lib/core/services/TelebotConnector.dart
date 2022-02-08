// Bot Token 5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg
import 'package:teledart/teledart.dart';
import 'package:teledart/telegram.dart';
import 'package:teledart/model.dart';

class TelebotConnector {
  TelebotConnector();

  Future<void> sendMovement(String vehicleNo, String locationEnd, String purposeOfTrip, String toRank, String toFullName, String vcRank, String vcFullName) async {
    var botToken = "5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg";
    var username = (await Telegram(botToken).getMe()).username;
    var teledart = TeleDart(botToken, Event(username!));
    teledart.start();
    teledart.sendMessage('-1001585228215', "MID" + vehicleNo + " moving to " + locationEnd + " for " + purposeOfTrip + "\nTO: " + toRank + " " + toFullName + "\nVC: " + vcRank + " " + vcFullName);
    teledart.stop();
  }

  Future<void> endMovement(String vehicleNo, String locationEnd, String toRank, String toFullName, String vcRank, String vcFullName) async {
    var botToken = "5269781876:AAFh-XytRqwAroOE2lpDA4FyaWfQqkkTUzg";
    var username = (await Telegram(botToken).getMe()).username;
    var teledart = TeleDart(botToken, Event(username!));
    teledart.start();
    teledart.sendMessage('-1001585228215', "MID" + vehicleNo + " arrived at " + locationEnd + "\nTO: " + toRank + " " + toFullName + "\nVC: " + vcRank + " " + vcFullName);
    teledart.stop();
  }
}