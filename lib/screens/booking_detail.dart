import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'customCard.dart';

class BookingDetail extends StatefulWidget {
  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<BookingDetail> {
  FirebaseUser user;
  String error;

  void setUser(FirebaseUser user) {
    setState(() {
      this.user = user;
      this.error = null;
    });
  }

  void setError(e) {
    setState(() {
      this.user = null;
      this.error = e.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then(setUser).catchError(setError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
      title: Text('DUMPOHEALTH',
        style:TextStyle(
          fontFamily: 'Philosopher',
          fontWeight: FontWeight.w700,
        ),),
      backgroundColor: Colors.black,
    ),
      body: user != null ? _buildSetting(context) : Text("Error: $error"),
    );
  }

  Widget _buildSetting(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection('users').document(user.uid).collection('tasks').snapshots(),
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData ) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView(
              children: snapshot.data.documents
                  .map((DocumentSnapshot document) {
                return new CustomCard(
                  booking_date: document['booking_date'],
                  booking_time: document['booking_time'],
                  pickup_place: document['pickup_place'],
                  drop_place: document['drop_place'],
                );
              }).toList(),
            );
          }
        });
  }
}