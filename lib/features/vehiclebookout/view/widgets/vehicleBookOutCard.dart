import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ltcapp/core/config/globals.dart';

class VehicleBookOutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue,
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album, size: 70),
              title:
                  Text('Heart Shaker', style: TextStyle(color: Colors.white)),
              subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
            ),
            ButtonBarTheme(
              data: ButtonBarThemeData(),
              child: ButtonBar(
                children: <Widget>[
                  TextButton(
                    child: const Text('Edit',
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('Delete',
                        style: TextStyle(color: Colors.white)),
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
