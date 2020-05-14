import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubdetailCard extends StatelessWidget {
  SubdetailCard({@required this.booking_date, this.booking_time, this.pickup_place, this.drop_place});

  final booking_date;
  final booking_time;
  final pickup_place;
  final drop_place;

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
                  leading: Icon(Icons.calendar_today),
                  title: Text('Booking Date'),
                  subtitle:Text(booking_date),
                ),
                ListTile(
                  leading: Icon(Icons.access_time),
                  title: Text('Booking Time'),
                  subtitle: Text(booking_time),
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Pickup Place'),
                  subtitle:Text(pickup_place),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital),
                  title: Text('Destination'),
                  subtitle:Text(drop_place),
                ),

              ],
            )
        )
    );
  }
}