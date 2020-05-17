import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'widgets/nav-drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title, this.uid}) : super(key: key); //update this to include the uid in the constructor
  final String title;
  final String uid; //include this

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController taskTitleInputController;
  TextEditingController taskDescripInputController;
  FirebaseUser currentUser;

  @override
  initState() {
    super.initState();
    taskTitleInputController = new TextEditingController();
    taskDescripInputController = new TextEditingController();
    this.getCurrentUser();

  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
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
          }
      );

      return value == true;
    },

     child: Scaffold(
       drawer: NavDrawer(),
      appBar: AppBar(
       centerTitle: true,
       title: Text('DUMAPOHEALTH',
         style:TextStyle(
           fontFamily: 'Philosopher',
           fontWeight: FontWeight.w700,
         ),),
       backgroundColor: Colors.black,
     ),
      body:Container(
          margin: EdgeInsets.only(top: 45.0),
          child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: <Widget>[
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black12,
                                Colors.black26
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/services");
                          },
                          child: Card(
                            child: ListView(
                              children: <Widget>[
                                const ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        27.0, 5.0, 0.0, 0.0),
                                    leading: Icon(
                                      Icons.accessible,
                                      size: 90,
                                      color: Colors.black87,
                                    )),
                                SizedBox(
                                  height: 25.0,
                                ),
                                const ListTile(
                                  title: Text(
                                    'Services',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    //end of container 1
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.black26,
                              Colors.black12,
                              Colors.black26
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          )),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/vehicles");
                        },
                        child: Card(
                          child: ListView(
                            children: <Widget>[
                              const ListTile(
                                  contentPadding:
                                  EdgeInsets.fromLTRB(27.0, 0.0, 0.0, 0.0),
                                  leading: Icon(
                                    Icons.directions_car,
                                    size: 90,
                                    color: Colors.black87,
                                  )),
                              SizedBox(
                                height: 25.0,
                              ),
                              const ListTile(
                                title: Text(
                                  'Vehicles',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    //end of container 2
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black12,
                                Colors.black26
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/requirements");
                          },
                          child: Card(
                            child: ListView(
                              children: <Widget>[
                                const ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        27.0, 5.0, 0.0, 0.0),
                                    leading: Icon(
                                      Icons.assignment,
                                      size: 90,
                                      color: Colors.black87,
                                    )),
                                SizedBox(
                                  height: 25.0,
                                ),
                                const ListTile(
                                  title: Text(
                                    'Requirements',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    //end of container 3
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black12,
                                Colors.black26
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/choose");
                          },
                          child: Card(
                            child: ListView(
                              children: <Widget>[
                                const ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        27.0, 5.0, 0.0, 0.0),
                                    leading: Icon(
                                      Icons.wb_incandescent,
                                      size: 90,
                                      color: Colors.black87,
                                    )),
                                SizedBox(
                                  height: 25.0,
                                ),
                                const ListTile(
                                  title: Text(
                                    'Why Choose',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    //end of container 4
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black12,
                                Colors.black26
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/contact");
                          },
                          child: Card(
                            child: ListView(
                              children: <Widget>[
                                const ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        27.0, 5.0, 0.0, 0.0),
                                    leading: Icon(
                                      Icons.contact_mail,
                                      size: 90,
                                      color: Colors.black87,
                                    )),
                                SizedBox(
                                  height: 25.0,
                                ),
                                const ListTile(
                                  title: Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    //end of container 5
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black26,
                                Colors.black12,
                                Colors.black26
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/booking");
                          },
                          child: Card(
                            child: ListView(
                              children: <Widget>[
                                const ListTile(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        27.0, 0.0, 0.0, 0.0),
                                    leading: Icon(
                                      Icons.chrome_reader_mode,
                                      size: 90,
                                      color: Colors.black87,
                                    )),
                                SizedBox(
                                  height: 25.0,
                                ),
                                const ListTile(
                                  title: Text(
                                    'Booking',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                    //end of container 6
                  ],
                ),
              ),
            ],
          )),
     ),
    );
  }
}