
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/Globals.dart';

class CheckInStatusCard extends StatelessWidget {
  const CheckInStatusCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Material(
          elevation: 1,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.verified_user),
                  elevation: 0,
                  title: Text(
                    ///Input link to time here
                   "Formatted time here"
                  ),
                  backgroundColor: darkGreenAccent,
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.list),
                      onPressed:(){},
                    )
                  ],
                ),
                Padding(
                  padding:
                  EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'NRIC',
                      hintText: 'Last 4 Digits only',
                      icon: Icon(Icons.person),
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  padding:
                  EdgeInsets.only(left: 16, right: 16, top: 24),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      enabled: false,
                      prefixIcon: Icon(
                        FontAwesomeIcons.penNib,
                        size: 15.0,
                        color: Colors.black,
                      ),
                    ),


                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: 24,
                    top: 24,
                  ),
                  /// Child Button here
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
