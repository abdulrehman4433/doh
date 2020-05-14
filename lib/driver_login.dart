import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class DriverLogin extends StatefulWidget {
  DriverLogin({Key key}) : super(key: key);

  @override
  _DriverLogin createState() => _DriverLogin();
}

class _DriverLogin extends State<DriverLogin> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController emailInputController;
  TextEditingController pwdInputController;

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Colors.black,
        ),
        body: Container(
            padding: const EdgeInsets.only(top:150.0, left:20.0, right: 20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _loginFormKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email*', hintText: "john.doe@gmail.com",
                          border: new OutlineInputBorder(),),
                        controller: emailInputController,
                        keyboardType: TextInputType.emailAddress,
                        validator: emailValidator,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password*', hintText: "********",
                          border: new OutlineInputBorder(),),
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
                            FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                                .then((authResult) => Firestore.instance
                                .collection("drivers")
                                .document(authResult.user.uid)
                                .get()
                                .then((DocumentSnapshot result) =>
                            {

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomePage(
                                            title: result["fname"] +
                                                "'s Tasks",
                                            uid: authResult.user.uid,
                                          )))
                            }
                            )
                                .catchError((err) => print(err)))
                                .catchError((err) => print(err));
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Don't have an account yet?"),
                      FlatButton(
                        child: Text("Register here!"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/driverregister");
                        },
                      )
                    ],
                  ),
                ))));
  }
}