import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Requirements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
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
                          'Vehicle requirements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        alignment: Alignment.center,
                        child: Image(image: AssetImage('assets/images/rq1.jpg')
                        ),
                      ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('2009 or newer'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('4 doors'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('5-8 seats, including the driver’s'),
                  )
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
                      'Driver requirements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/images/rq2.jpg')
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Valid driver’s license — out-of-state licenses are also acceptable.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('You must be at least 21 years old.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Licensed to drive in the US for at least one year.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Pass a driver screening, which reviews your driving history and criminal background check.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Smartphone that can download and run the Dumapohealth Driver app.'),
                  )
                ],
              ),
            ),
            //end of 2
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'Document requirements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/images/rq3.png')
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Driver profile photo.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Vehicle registration.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Vehicle insurance.'),
                  )
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
                      'Types of Cars',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/images/rq4.jpg')
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('4-Door Sedans.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('SUVs.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Mini-Vans.'),
                  ),ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Station Wagons.'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Wheelchair Accessible Vehicles.'),
                  )
                ],
              ),
            ),
            //end of 4
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const ListTile(
                    title: Text(
                      'Emblem requirements',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Image(image: AssetImage('assets/images/rq5.png')
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text('Drivers are required to display the Dumapohealth emblem while in driver mode.'),
                  ),
                ],
              ),
            ),

           ]
        ),
      ),
    )
    );
  }
}
