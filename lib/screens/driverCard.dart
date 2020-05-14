import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverCard extends StatelessWidget {
  DriverCard({@required this.fname, this.phoneno, this.licenseno, this.vehicleno,
    this.vehicletype, this.email, this.uid,});

  final fname;
  final phoneno;
  final licenseno;
  final vehicleno;
  final vehicletype;
  final email;
  final uid;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.account_box),
                  title: Text('Name'),
                  subtitle: Text(fname),
                ),
                ListTile(
                  leading: Icon(Icons.phone_android),
                  title: Text('Phone No.'),
                  subtitle: Text(phoneno),
                ),
                ListTile(
                  leading: Icon(Icons.airplay),
                  title: Text('License No.'),
                  subtitle: Text(licenseno),
                ),
                ListTile(
                  leading: Icon(Icons.airplay),
                  title: Text('Vehicle No.'),
                  subtitle: Text(vehicleno),
                ),
                ListTile(
                  leading: Icon(Icons.directions_car),
                  title: Text('Vehicle Tyle'),
                  subtitle: Text(vehicletype),
                ),
                ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                  subtitle: Text(email),
                ),

              ],
            )
        )
    );
  }
}