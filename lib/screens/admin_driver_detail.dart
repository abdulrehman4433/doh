import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'driverCard.dart';

class AdminDriverDetail extends StatefulWidget {
  @override
  _SettingsState createState() {
    return _SettingsState();
  }
}

class _SettingsState extends State<AdminDriverDetail> {
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
        stream: Firestore.instance.collection('drivers').snapshots(),
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
                return new DriverCard(
                  fname: document['fname'],
                  phoneno: document['phoneno'],
                  licenseno: document['licenseno'],
                  vehicleno: document['vehicleno'],
                  vehicletype: document['vehicletype'],
                  email: document['email'],
                  uid: document['uid'],
                );
              }).toList(),
            );
          }
        });
  }
}
