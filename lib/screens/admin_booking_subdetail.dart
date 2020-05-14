import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'subdetailCard.dart';

class AdminBookingSubDetail extends StatefulWidget {
  AdminBookingSubDetail({Key key, this.title, this.uid}) : super(key: key);
  //update the constructor to include the uid
  final String title;
  final String uid;

  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<AdminBookingSubDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'DUMPOHEALTH',
          style: TextStyle(
            fontFamily: 'Philosopher',
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: buildSetting(context)
      ,
    );
  }

  Widget buildSetting(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('users').document(widget.uid).collection('tasks').snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children:
              snapshot.data.documents.map((DocumentSnapshot document) {
                return new SubdetailCard(
                  booking_date: document['booking_date'],
                  booking_time: document['booking_time'],
                  drop_place: document['drop_place'],
                  pickup_place: document['pickup_place'],
                );
              }).toList(),
            );
          }
        });
  }
}
