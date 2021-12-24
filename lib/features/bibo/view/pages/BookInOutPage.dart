import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/globals.dart';
import 'package:intl/intl.dart';

class BookInOutPage extends StatefulWidget {
  @override
  _BookInOutPageState createState() => _BookInOutPageState();
}

class _BookInOutPageState extends State<BookInOutPage> {
  String formattedTime = DateFormat("jm").format(DateTime.now().toLocal());

  static final List<String> chartDropdownItems = [
    'Book In',
    'Book Out',
  ];

  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Book in/Book Out",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => {
            Navigator.pop(context),
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                              formattedTime,
                            ),
                            backgroundColor: Theme.of(context).accentColor,
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
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    isDense: true,
                                    value: actualDropdown,
                                    /*onChanged: (String value) => setState(() {
                                          actualDropdown = value;
                                          actualChart =
                                              chartDropdownItems.indexOf(
                                                  value); // Refresh the chart
                                        }),*/
                                    items: chartDropdownItems.map((String title) {
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
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                              bottom: 24,
                              top: 24,
                            ),
                            child: _bookInOutButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bookInOutButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.blue,
          ),
          child: Text(
            'Submit',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
