import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ltcapp/core/config/globals.dart';

class BookInOutPage extends StatefulWidget {
  @override
  _BookInOutPageState createState() => _BookInOutPageState();
}

class _BookInOutPageState extends State<BookInOutPage> {

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
                            title: Text('Book in'),
                            backgroundColor: Theme.of(context).accentColor,
                            centerTitle: true,
                            actions: <Widget>[
                              IconButton(
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                            child: TextFormField(
                              validator: (val) =>
                              val.length > 3 ? null : 'Full name is invalid',
                              decoration: InputDecoration(
                                labelText: 'Rank + Name',
                                hintText: 'Enter your full name',
                                icon: Icon(Icons.person),
                                isDense: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'NRIC',
                                hintText: 'NRIC',
                                icon: Icon(FontAwesomeIcons.idCard),
                                isDense: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                            title: Text('Book Out'),
                            backgroundColor: Theme.of(context).accentColor,
                            centerTitle: true,
                            actions: <Widget>[
                              IconButton(
                                icon: Icon(Icons.delete),
                              )
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                            child: TextFormField(
                              validator: (val) =>
                              val.length > 3 ? null : 'Full name is invalid',
                              decoration: InputDecoration(
                                labelText: 'Rank + Name',
                                hintText: 'Enter your full name',
                                icon: Icon(Icons.person),
                                isDense: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'NRIC',
                                hintText: 'NRIC',
                                icon: Icon(FontAwesomeIcons.idCard),
                                isDense: true,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
