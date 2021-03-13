import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:ltcapp/features/home/viewmodel/HomePageViewModel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final List<String> chartDropdownItems = [
    'Total',
    'January',
    'February',
    'March',
    'April',
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<HomePageViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('ETMS',
            style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 30.0)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Consumer<HomePageViewModel>(
                  builder: (context, vm, child) => DropdownButton(
                      isDense: true,
                      value: vm.campDropdown,
                      onChanged: (String value) => vm.campDropdownUpdate(value),
                      items: HomePageViewModel.campDropdownItems
                          .map((String title) {
                        return DropdownMenuItem(
                          value: title,
                          child: Text(title,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0)),
                        );
                      }).toList()),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        color: Color(0xffDCDDDB),
        child: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
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
                          Text('Welcome',
                              style: TextStyle(color: Colors.blueAccent)),
                          Text('PTE Aaron',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
                        ],
                      ),
                      Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.settings,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
            ),
            _buildTile(
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Mileage',
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 20.0)),
                              Text('3012Km',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 34.0)),
                            ],
                          ),
                          DropdownButton(
                              isDense: true,
                              value: actualDropdown,
                              onChanged: (String value) => setState(() {
                                    actualDropdown = value;
                                    actualChart = chartDropdownItems
                                        .indexOf(value); // Refresh the chart
                                  }),
                              items: chartDropdownItems.map((String title) {
                                return DropdownMenuItem(
                                  value: title,
                                  child: Text(title,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0)),
                                );
                              }).toList())
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 4.0)),
                    ],
                  )),
            ),
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
                              child: Icon(FontAwesomeIcons.penFancy,
                                  color: Colors.white, size: 30.0),
                            )),
                        Padding(padding: EdgeInsets.only(bottom: 16.0)),
                        Text('BIBO',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 24.0)),
                        Text('Book in/Book out',
                            style: TextStyle(color: Colors.black45)),
                      ]),
                ),
                onTap: () => Navigator.pushNamed(context, '/bookInOut')),
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
              onTap: () => Navigator.pushNamed(context, '/vehicleManagement'),
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
                      Text('Mileage History',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 22.0)),
                    ]),
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
                          color: Colors.amber,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(FontAwesomeIcons.clipboard,
                                color: Colors.white, size: 30.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('DTL Report',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0)),
                      Text('For DTL/ ADTL',
                          style: TextStyle(color: Colors.black45)),
                    ]),
              ),
            ),
            _buildTile(
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
                            Text('Maintenance Section',
                                style: TextStyle(color: Colors.redAccent)),
                            Text('ODD, Fuel Receipts',
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
                              child: Icon(Icons.credit_card,
                                  color: Colors.white, size: 30.0),
                            )))
                      ]),
                ),
                onTap: () {})
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(1, 190.0),
            StaggeredTile.extent(1, 190.0),
            StaggeredTile.extent(1, 190.0),
            StaggeredTile.extent(1, 190.0),
            StaggeredTile.extent(2, 110.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
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
