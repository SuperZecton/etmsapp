import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:ltcapp/features/home/view/widgets/AfterLoginDrawer.dart';
import 'package:ltcapp/features/home/view/widgets/TopContainer.dart';
import 'package:ltcapp/features/home/viewmodel/AfterLoginPageViewModel.dart';
import 'package:stacked/stacked.dart';

class AfterLoginPage extends StatelessWidget {
  const AfterLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ViewModelBuilder<AfterLoginViewModel>.reactive(
        viewModelBuilder: () => AfterLoginViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            key: model.scaffoldKey,
            drawer: AfterLoginDrawer(),
            body: Container(
              color: Theme.of(context).backgroundColor,
              height: height,
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
                                      model.fetchingName && model.fetchingRank
                                          ? 'Welcome'
                                          : 'Welcome ${model.fetchedRank.toString()} ${model.fetchedName.toString()}',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: darkTextColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          model.fetchingNRIC
                                              ? ''
                                              : "${model.fetchedNRIC.toString()}  ",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: darkTextColor,
                                          ),
                                        ),
                                        Text(
                                          model.fetchingVocation
                                              ? ''
                                              : model.fetchedVocation
                                                  .toString(),
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.roboto(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: darkTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      model.currentDate ?? '',
                                      textAlign: TextAlign.left,
                                      style: GoogleFonts.roboto(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: darkTextColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Every tasking is a mission. Drive safe, do not rush. \nSafe always, Good to go!',
                      style: GoogleFonts.lato(
                          color: darkTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 20),
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
                                    color: Colors.redAccent,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.checkSquare,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Book in/Book out',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor,
                                  ),
                                ),
                              ]),
                        ),
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
                                    color: Colors.orangeAccent,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.listAlt,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'MT-Rac Form',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor,
                                  ),
                                ),
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
                                    color: Colors.blueAccent,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.car,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'TO Section',
                                  style: GoogleFonts.roboto(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: darkTextColor,
                                  ),
                                ),
                              ]),
                        ),
                        onTap: () => model.TOPush(context),
                      ),
                      _buildTile(
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Material(
                                    color: darkPrimary300,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.pencilRuler,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Admin Section',
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
                        onTap: () => showDialog(
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
                                    color: darkPrimary300,
                                    shape: CircleBorder(),
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Icon(FontAwesomeIcons.dumbbell,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Training Section',
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
                        onTap: () => showDialog(
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
                                    color: darkPrimary300,
                                    shape: CircleBorder(),
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(FontAwesomeIcons.wrench,
                                          color: Colors.white, size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Maintenance Section',
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
                        onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Function Not Available Yet"),
                            );
                          },
                        ),
                      ),
                    ],
                    staggeredTiles: [
                      StaggeredTile.extent(1, 190.0),
                      StaggeredTile.extent(1, 190.0),
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
        });
  }

  Widget _buildTile(Widget child, {Function()? onTap}) {
    return Material(
        elevation: 12.0,
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: darkPrimary600,
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
