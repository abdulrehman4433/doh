import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'bookingCard.dart';

class AdminBookingDetail extends StatefulWidget {
  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<AdminBookingDetail> {
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
      body: _buildSetting(context),
    );
  }

  Widget _buildSetting(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('users').snapshots(),
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
                return new BookingCard(
                  fname: document['fname'],
                  phoneno: document['phoneno'],
                  email: document['email'],
                  uid: document['uid'],
                );
              }).toList(),
            );
          }
        });
  }
}
