import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';

class DriverRegister extends StatefulWidget {
  DriverRegister({Key key}) : super(key: key);
  @override
  _DriverRegister createState() => _DriverRegister();
}

class _DriverRegister extends State<DriverRegister> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController fullNameInputController;
  TextEditingController phonenoInputController;
  TextEditingController licensenoInputController;
  TextEditingController vehiclenoInputController;
  TextEditingController vehicletypeInputController;
  TextEditingController emailInputController;
  TextEditingController pwdInputController;
  TextEditingController confirmPwdInputController;


  List<String> _locations = ['Sedans', 'SUVs', 'Minivans', 'Wheelchair Accessible Vehicles']; // Option 2
  String _selectedLocation; // Option
  @override
  initState() {
    super.initState();
    fullNameInputController = new TextEditingController();
    phonenoInputController = new TextEditingController();
    licensenoInputController = new TextEditingController();
    vehiclenoInputController = new TextEditingController();
    vehicletypeInputController = new TextEditingController();
    emailInputController = new TextEditingController();
    pwdInputController = new TextEditingController();
    confirmPwdInputController = new TextEditingController();
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
          title: Text("Register"),
          backgroundColor: Colors.black,
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
                child: Form(
                  key: _registerFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Full Name*', hintText: "John",
                          border: new OutlineInputBorder(),),
                        controller: fullNameInputController,
                        validator: (value) {
                          if (value.length < 3) {
                            return "Please enter a valid full name.";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Phone No*', hintText: "+1(123)-456-7890",
                          border: new OutlineInputBorder(),),
                        controller: phonenoInputController,
                        validator: (value) {
                          if (value.length < 10) {
                            return "Please enter a valid phone no.";
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'License No*',
                            hintText: "DL-123-456–7890",
                            border: new OutlineInputBorder(),),
                          controller: licensenoInputController,
                          ),
                      SizedBox(
                        height: 10,
                      ),TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Vehicle No*',
                            hintText: "LHR-123-456–7890",
                            border: new OutlineInputBorder(),),
                          controller: vehiclenoInputController,),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            labelText: 'Choose Vehicle Type*', hintText: "Choose Vehicle Type",
                            border: new OutlineInputBorder(),
                          ),
                          isDense: true,
                          // Not necessary for Option 1
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                            });
                          },
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              child: new Text(location),
                              value: location,
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email*', hintText: "john.doe@gmail.com",
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
                          labelText: 'Password*', hintText: "********",
                          border: new OutlineInputBorder(),),
                        controller: pwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Confirm Password*', hintText: "********",
                          border: new OutlineInputBorder(),),
                        controller: confirmPwdInputController,
                        obscureText: true,
                        validator: pwdValidator,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        child: Text("Register"),
                        splashColor: Colors.blue[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.black)),
                        color: Colors.white,
                        textColor: Color(0xFF0074E4),
                        onPressed: () {
                          if (_registerFormKey.currentState.validate()) {
                            if (pwdInputController.text ==
                                confirmPwdInputController.text) {
                              FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                  email: emailInputController.text,
                                  password: pwdInputController.text)
                                  .then((authResult) => Firestore.instance
                                  .collection("drivers")
                                  .document(authResult.user.uid)
                                  .setData({
                                "uid": authResult.user.uid,
                                "fname": fullNameInputController.text,
                                "phoneno": phonenoInputController.text,
                                "licenseno": licensenoInputController.text,
                                "vehicleno": vehiclenoInputController.text,
                                "vehicletype": vehicletypeInputController.text,
                                "email": emailInputController.text,
                              })
                                  .then((result) => {
                                Container(
                                  child: CircularProgressIndicator(),
                                ),
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage(
                                          title:
                                          fullNameInputController
                                              .text +
                                              "'s Tasks",
                                          uid: authResult.user.uid,
                                        )),
                                        (_) => false),
                                fullNameInputController.clear(),
                                phonenoInputController.clear(),
                                emailInputController.clear(),
                                pwdInputController.clear(),
                                confirmPwdInputController.clear()
                              })
                                  .catchError((err) => print(err)))
                                  .catchError((err) => print(err));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("The passwords do not match"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text("Close"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text("Already have an account?"),
                      FlatButton(
                        child: Text("Login here!"),
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        },
                      )
                    ],
                  ),
                ))));
  }
}
