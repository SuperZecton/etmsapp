import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ltcapp/core/config/Globals.dart';
import 'package:intl/intl.dart';
import 'package:ltcapp/features/admin/view/widgets/CurrentStrengthCard.dart';
import 'package:ltcapp/features/detailing/viewmodel/DetailingMainViewModel.dart';
import 'package:ltcapp/features/detailing/view/widgets/DetailListCard.dart';
import 'package:ltcapp/features/admin/viewmodel/AdminMainViewModel.dart';
import 'package:ltcapp/features/admin/viewmodel/ParadeStateViewModel.dart';
import 'package:stacked/stacked.dart';

class DetailingMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailingMainViewModel>.reactive(
        viewModelBuilder: () => DetailingMainViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            appBar: AppBar(
              title: Text(
                "Detailing Section",
                style: GoogleFonts.roboto(color: darkTextColor, fontSize: 24.0),
              ),
              centerTitle: true,
              backgroundColor: darkGreenColor,
            ),
            body: Container(
              color: Theme.of(context).backgroundColor,
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  DetailListCard(),
                  SizedBox(height: 20,),
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
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(
                                          FontAwesomeIcons.clipboardCheck,
                                          color: Colors.white,
                                          size: 30.0),
                                    )),
                                Padding(padding: EdgeInsets.only(bottom: 16.0)),
                                Text(
                                  'Add Detail',
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
                        onTap: () => model.onParadePush(context),
                      ), // COPY PASTE FROM HERE IF NEED
                    ],
                    staggeredTiles: [
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
