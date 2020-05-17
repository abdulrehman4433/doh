import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget{
  _Admindashboard createState() => _Admindashboard();
}

class _Admindashboard extends State<AdminDashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return WillPopScope(
        onWillPop: () async {
      final value = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Are you sure you want to exit?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                FlatButton(
                  child: Text('Yes, exit'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          });

      return value == true;
    },

        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('DUMAPOHEALTH',
              style:TextStyle(
                fontFamily: 'Philosopher',
                fontWeight: FontWeight.w700,
              ),),
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
                          Navigator.pushNamed(context, "/admin_booking");
                        },
                        child: Container(
                            width: 250.0,
                            height: 150.0,
                            color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 100.0),
                            child: Center(
                              child: Text('Booking List',
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
                          Navigator.pushNamed(context, "/admin_driver");
                        },
                        child: Container(
                            width: 250.0,
                            height: 150.0,
                            color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 50.0),
                            child: Center(
                              child: Text('Drivers Detail',
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
                          Navigator.pushReplacementNamed(context, "/siginupdecision");
                        },
                        child: Container(
                            width: 250.0,
                            height: 150.0,
                            color: Colors.black12,
//                      margin: EdgeInsets.only(left: 27.0, right: 25.0, top: 50.0),
                            child: Center(
                              child: Text('Logout',
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
          )
        )
    );
  }

}