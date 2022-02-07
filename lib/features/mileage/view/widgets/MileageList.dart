import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/features/mileage/view/widgets/MileageListCard.dart';

class MileageList extends StatefulWidget {
  @override
  _MileageListState createState() => _MileageListState();
}

class _MileageListState extends State<MileageList> {
  var simpleList = [
    "41599",
    "46190",
    "40921",
    "86",
    "46215",
    "162",
    "46299",
  ];
  var dateList = [
    "21/01/22",
    "22/01/22",
    "25/01/22",
    "26/01/22",
    "31/01/22",
    "01/02/22",
    "08/02/22",
  ];
  var startOdoList = [
    "1002",
    "5345",
    "34533",
    "23453",
    "87653",
    "23453",
    "87653",
  ];
  var endOdoList = [
    "1009",
    "5347",
    "34536",
    "25460",
    "87656",
    "25460",
    "87656",
  ];
  List<int> mileageList = [7, 2, 3, 7, 3, 7,3];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: simpleList.length,
      itemBuilder: (context, index) {
        final item = simpleList[index];
        return MileageListCard(
          vehicleNo: simpleList[index],
          date: dateList[index],
          startOdo: startOdoList[index],
          endOdo: endOdoList[index],
          mileage: mileageList[index],
        );
      },
    );
  }
}
