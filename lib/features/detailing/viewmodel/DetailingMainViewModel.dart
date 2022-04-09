import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/services/CurrentSession.dart';
import 'package:ltcapp/core/services/DatabaseConnector.dart';
import 'package:stacked/stacked.dart';

class DetailingMainViewModel extends MultipleFutureViewModel {
  DatabaseHandler db = DatabaseHandler();
  static const String _detailsInLTCFuture = "ltc";
  static const String _detailsInBPCFuture = "bpc";
  String? get fetchedDetailsInLTC => dataMap![_detailsInLTCFuture];
  bool get fetchingDetailsInLTC => busy(_detailsInLTCFuture);
  String? get fetchedDetailsInBPC => dataMap![_detailsInBPCFuture];
  bool get fetchingDetailsInBPC => busy(_detailsInBPCFuture);

  @override

  Map<String, Future Function()> get futuresMap => {
        _detailsInLTCFuture: getDetailLTC,
        _detailsInBPCFuture: getDetailBPC,
      };

  Future<String?> getDetailLTC() async {
    String? _totalLTCDetails = await db.getDetailsInLTC();
    return _totalLTCDetails;
  }

  Future<String?> getDetailBPC() async {
    String? _totalBPCDetails = await db.getDetailsInBPC();
    return _totalBPCDetails;
  }

  void onParadePush(BuildContext context) {
    Navigator.pushNamed(context, '/detailingAddDetail');
  }

  void floatingButtonPress(BuildContext context) {}

}
