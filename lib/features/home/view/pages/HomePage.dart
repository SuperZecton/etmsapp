import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/features/home/view/widgets/CampDropDownList.dart';
import 'package:ltcapp/features/home/view/widgets/DateDropDownList.dart';
import 'package:ltcapp/features/home/view/widgets/TripInfoCard.dart';
import 'package:ltcapp/features/home/view/widgets/topContainer.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final vm = Provider.of<HomePageViewModel>(context, listen: false);
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: ListView(
          padding: const EdgeInsets.all(0.0),
          shrinkWrap: true,
          children: [
            TopContainer(
              height: 200,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 25.0,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'LTC TMS Application',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    'Welcome',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: Text(
                                    '',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "E-Mileage",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Select Month",
                        style: TextStyle(
                          fontSize: 19.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Class 3: ",
                              style: TextStyle(
                                  fontSize: 19.0, color: Colors.black),
                            ),
                            SizedBox(height: 10),
                            Text("Class 4: ",
                                style: TextStyle(
                                    fontSize: 19.0, color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TripInfoCard(),
            SizedBox(height: 40,),
            StaggeredGridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 12.0,
              mainAxisSpacing: 12.0,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              children: <Widget>[
                /*_buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Book Out Vehicle',
                                    style: TextStyle(color: Colors.redAccent)),
                                Text('VEHICLE INFO HERE',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26.0))
                              ],
                            ),
                            Material(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(FontAwesomeIcons.caravan,
                                      color: Colors.white, size: 30.0),
                                )))
                          ]),
                    ),
                    onTap: () {}),*/

                _buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Material(
                                color: Colors.teal,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(FontAwesomeIcons.checkSquare,
                                      color: Colors.white, size: 30.0),
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 16.0)),
                            Text('Safe-Entry cum BIBO',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.0)),
                            //Text('Book in/Book out',
                                //style: TextStyle(color: Colors.black45)),
                          ]),
                    ),
                    //onTap: () => Navigator.pushNamed(context, '/bookInOut')),
                    onTap: () => vm.safeEntryURLPush(),
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.orange,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(FontAwesomeIcons.car,
                                    color: Colors.white, size: 30.0),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('Book Out Vehicle',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0)),
                        ]),
                  ),
                  onTap: () =>
                      /*Navigator.pushNamed(context, '/vehicleManagement'),*/
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Function Not Available Yet"),
                        );
                      })
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.cyan,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Icon(FontAwesomeIcons.listAlt,
                                    color: Colors.white, size: 30.0),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('MT-RAC Form',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0)),
                        ]),
                  ),
                  onTap: () => vm.racFormURLPush(),
                ),
                _buildTile(
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Material(
                              color: Colors.amber,
                              shape: CircleBorder(),
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Icon(FontAwesomeIcons.clipboardCheck,
                                    color: Colors.white, size: 30.0),
                              )),
                          Padding(padding: EdgeInsets.only(bottom: 16.0)),
                          Text('SHRO Forms',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24.0)),
                          //Text('For DTL/ ADTL',
                              //style: TextStyle(color: Colors.black45)),
                        ]),
                  ),
                  onTap: () => vm.shroFormURLPush(),
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 190.0),
                StaggeredTile.extent(1, 190.0),
                StaggeredTile.extent(1, 190.0),
                StaggeredTile.extent(1, 190.0),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      
        elevation: 12.0,
        borderRadius: BorderRadius.circular(12.0),
        //shadowColor: Color(0x802196F3),
        child: Container(
          /*decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black=
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12.0)),*/
          child: InkWell(
              // Do onTap() if it isn't null, otherwise do print()
              onTap: onTap != null
                  ? () => onTap()
                  : () {
                      print('Not set yet');
                    },
              child: child),
        ));
  }
}
