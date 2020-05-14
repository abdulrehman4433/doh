import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.only(top: 50.0),
            child: Text(
              'Menu Options',
              style: TextStyle(color: Colors.white, fontSize: 25),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.accessible),
            title: Text('Services'),
            onTap: () {
              Navigator.pushNamed(context, "/services");
            }
          ),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Vehicle'),
            onTap: (){
              Navigator.pushNamed(context, "/vehicles");
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Requirements'),
            onTap: ()  {
              Navigator.pushNamed(context, "/requirements");
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_incandescent),
            title: Text('Why Choose Us'),
            onTap: () {
            Navigator.pushNamed(context, "/choose");
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Contact Us'),
            onTap: () {
            Navigator.pushNamed(context, "/contact");
            },
          ),
          ListTile(
            leading: Icon(Icons.chrome_reader_mode),
            title: Text('Booking'),
            onTap: ()  {Navigator.pushNamed(context, "/booking");},
          ),
          ListTile(
            leading: Icon(Icons.speaker_notes),
            title: Text('Booking Detail'),
            onTap: ()  {Navigator.pushNamed(context, "/bookingDetail");},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((result) =>
                  Navigator.pushReplacementNamed(context, "/siginupdecision"))
                  .catchError((err) => print(err));
            },
          ),
        ],
      ),
    );
  }
}
