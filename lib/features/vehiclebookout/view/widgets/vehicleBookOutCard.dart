import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/globals.dart';

class VehicleBookOutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 175,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(

              title:
                  Text('Current Trip', style: TextStyle(color: Colors.black)),
              subtitle: Text('Time started', style: TextStyle(color: Colors.black)),
            ),
            ButtonBarTheme(
              data: ButtonBarThemeData(),
              child: ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    child: const Text('Cancel',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('End Trip',
                        style: TextStyle(color: Colors.black)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
