import 'package:flutter/material.dart';

class Services extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('DUMAPOHEALTH',
            style:TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
            ),),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: ListView(
            children: <Widget>[
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ListTile(
                      title: Text(
                        'Trip from your door',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('assets/images/s1.jpg')
                      ),
                    ),
                  ],
                ),
              ),
              //end of 1
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ListTile(
                      title: Text(
                        'To your health care practitioner',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      child: Image(image: AssetImage('assets/images/s2.jpg')
                      ),
                    ),
                  ],
                ),
              ),
              //end of 2
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        'Experience Drivers',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        '24/7 Full-Service Transportation',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        'Trip from your door',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        'To your health care practitioner',
                      ),
                    ),
                  ],
                ),
              ),
              //end of 3
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const ListTile(
                      title: Text(
                        'Benefits of Hiring Us',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        'Safety First',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        'Resonable Rates',
                      ),
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black87,
                      ),
                      title: Text(
                        '24/7 Transportation Service',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}