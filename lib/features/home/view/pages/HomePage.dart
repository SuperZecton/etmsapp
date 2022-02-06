import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/view/futurewidgets/FullNameTextWidget.dart';
import 'package:ltcapp/features/home/view/futurewidgets/FutureTripInfoCard.dart';
import 'package:ltcapp/features/home/view/futurewidgets/NRICTextWidget.dart';
import 'package:ltcapp/features/home/view/widgets/CampDropDownList.dart';
import 'package:ltcapp/features/home/view/widgets/DateDropDownList.dart';
import 'package:ltcapp/features/home/view/widgets/HomePageDrawer.dart';
import 'package:ltcapp/features/home/view/widgets/MileageCard.dart';
import 'package:ltcapp/features/home/view/widgets/TopContainer.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            drawer: HomePageDrawer(),
            body: Container(
              color: Theme.of(context).backgroundColor,
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                children: [
                  TopContainer(
                    height: 180,
                    width: width,
                    color: darkGreenColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () => model.onDrawerMenuTap(),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                            InkWell(
                              child: Icon(
                                Icons.settings,
                                color: Colors.white,
                                size: 25.0,
                              ),
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
                                      'Welcome to LTC',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: darkTextColor,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(right: 10.0),
                                        child: FullNameTextWidget(),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 10.0),
                                    child: NRICTextWidget(),
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
                  MileageCard(),
                  SizedBox(
                    height: 40,
                  ),
                  FutureTripInfoCard(),
                  SizedBox(
                    height: 40,
                  ),
                  StaggeredGridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    children: <Widget>[
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: darkSecondaryColor,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.checkSquare,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text('Safe-Entry',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: darkTextColor,
                                    ),),
                                //Text('Book in/Book out',
                                //style: TextStyle(color: Colors.black45)),
                              ]),
                        ),
                        //onTap: () => Navigator.pushNamed(context, '/bookInOut')),
                        onTap: () => model.safeEntryURLPush(),
                      ),
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: darkSecondaryColor,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.book,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text('Admin Section',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: darkTextColor,
                                    ),),
                              ]),
                        ),
                        onTap: () =>
                            showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Function Not Available Yet"),
                            );
                          },
                        ),
                      ),
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: darkSecondaryColor,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.listAlt,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text('MT-RAC Form',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: darkTextColor,
                                    ),),
                              ]),
                        ),
                        onTap: () => model.racFormURLPush(),
                      ),
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: darkSecondaryColor,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(
                                          FontAwesomeIcons.clipboardCheck,
                                          color: Colors.white,
                                          size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text('SHRO Forms',
                                    style: GoogleFonts.roboto(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: darkTextColor,
                                    ),),
                                //Text('For DTL/ ADTL',
                                //style: TextStyle(color: Colors.black45)),
                              ]),
                        ),
                        onTap: () => model.shroFormURLPush(),
                      ),
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                  color: darkSecondaryColor,
                                  shape: CircleBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
                                    child: Icon(FontAwesomeIcons.clipboardCheck,
                                        color: Colors.white, size: 30.0),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Maintenance',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor,
                                  ),
                                ),
                                //Text('For DTL/ ADTL',
                                //style: TextStyle(color: Colors.black45)),
                              ]),
                        ),
                        onTap: () => Navigator.pushNamed(
                            context, '/maintainencesdfiyhgsdfuhi'),
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(1, 190.0),
                      StaggeredTile.extent(1, 190.0),
                      StaggeredTile.extent(1, 190.0),
                      StaggeredTile.extent(1, 190.0),
                      StaggeredTile.extent(2, 190.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildTile(Widget child, {Function()? onTap}) {
    return Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: darkPrimary500,
              border: Border.all(
                color: darkPrimary700,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12.0)),
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
