import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class AdminLogin extends StatefulWidget {
  AdminLogin({Key key}) : super(key: key);

  @override
  _AdminLogin createState() => _AdminLogin();
}

class _AdminLogin extends State<AdminLogin> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;


  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Errors!"),
          content: new Text("Please check your password and email."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  initState() {
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
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
              });

          return value == true;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text("Login"),
              backgroundColor: Colors.black,
            ),
            body: Container(
                padding:
                    const EdgeInsets.only(top: 150.0, left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                    child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email*',
                          hintText: "john.doe@gmail.com",
                          border: new OutlineInputBorder(),
                        ),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password*',
                          hintText: "********",
                          border: new OutlineInputBorder(),
                        ),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        child: Text("Login"),
                        splashColor: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        color: Colors.white,
                        textColor: Color(0xFF0074E4),
                        onPressed: () {
                          if (_loginFormKey.currentState.validate()) {
                            if(emailInputController.text == 'admin@gmail.com'
                            && pwdInputController.text =='12345678'){
                              Navigator.pushNamed(context, "/admin_dashboard");
                            }else{
                              _showDialog();
                            }
                          }
                        },
                      ),
                    ],
                  ),
                )))));
  }
}
