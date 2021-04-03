import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TripInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 4,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Text(
                  'Current Trip',
                  style: TextStyle(
                    color: Color(0xff64676F),
                    fontFamily: 'Regular',
                    fontSize: 16,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: Text(
                  '',
                  style: TextStyle(
                    color: Color(0xff464855),
                    fontFamily: 'Regular',
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffF3F3FE),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Color(0xff415EF6),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'Add Vehicle',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xffFFF3F3),
                      ),
                      child: Icon(
                        FontAwesomeIcons.windowClose,
                        color: Color(0xffFD706B),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Material(
                    color: Colors.transparent,
                    child: Text(
                      'End Trip',
                      style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Regular',
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
