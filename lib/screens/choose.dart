import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choose extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: <Widget>[
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
                      'Highly trained professional drivers',
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
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text(
                      'First-rate customer service',
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
                      'Clean and well-maintained vehicles',
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
                    leading: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black87,
                    ),
                    title: Text(
                      'Innovative use of technology',
                    ),
                  ),
                ],
              ),
            ),
            //end of 4
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
                      'Punctuality and veracity',
                    ),
                  ),
                ],
              ),
            ),
            //end of 5
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
                      'The pursuit of continuous improvement',
                    ),
                  ),
                ],
              ),
            ),
            //end of 6
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
                      'Safety is our highest priority',
                    ),
                  ),
                ],
              ),
            ),
            //end of 7
          ],
        ),
      ),
    );
  }
}
