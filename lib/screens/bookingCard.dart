import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'admin_booking_subdetail.dart';

class BookingCard extends StatelessWidget {
  BookingCard({@required this.fname, this.phoneno,this.email, this.uid,});

  final fname;
  final phoneno;
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
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap:() {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminBookingSubDetail(
                              uid: uid,
                            )));
                  }
                ),
              ],
            )
        )
    );
  }
}