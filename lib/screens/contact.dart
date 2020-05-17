import 'package:flutter/material.dart';

class Contact extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('DUMAPOHEALTH',
            style:TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
            ),),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Contact us',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.black87,
                            ),
                            title: Text('63 Oak Street, Lewiston Maine 04240'),
                          ),
                        ],
                      ),
                    ),
                    //end of 1
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.phone_android,
                              color: Colors.black87,
                            ),
                            title: Text('832 212 9029'),
                          ),
                        ],
                      ),
                    ),
                    //end of 2
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.email,
                              color: Colors.black87,
                            ),
                            title: Text('info@dumapohealth.net'),
                          ),
                        ],
                      ),
                    ),
                    //end of 3
                    Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(
                              Icons.access_time,
                              color: Colors.black87,
                            ),
                            title: Text('24/7 open'),
                          ),
                        ],
                      ),
                    ),
              //end of 4
            ],
          ),
        ),
      ),
    );
  }

}