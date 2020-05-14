import 'package:doh/screens/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Decision extends StatelessWidget {
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/register");
                      },
                      child: Container(
                          width: 250.0,
                          height: 150.0,
                          color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 100.0),
                          child: Center(
                            child: Text('Register As customer',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0,
                                  fontFamily: 'Philosopher',
                                )),
                          )),
                    ),

                    SizedBox(height: 20.0,),
                    new GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/driverregister");
                      },
                      child: Container(
                          width: 250.0,
                          height: 150.0,
                          color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 50.0),
                          child: Center(
                            child: Text('Register As Driver',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0,
                                  fontFamily: 'Philosopher',
                                )),
                          )),
                    ),
                    SizedBox(height: 20.0,),
                    new GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/admin_login");
                      },
                      child: Container(
                          width: 250.0,
                          height: 150.0,
                          color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 50.0),
                          child: Center(
                            child: Text('Login As Admin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22.0,
                                  fontFamily: 'Philosopher',
                                )),
                          )),
                    )
                  ]),
            ),
          ],
        ));
  }
}