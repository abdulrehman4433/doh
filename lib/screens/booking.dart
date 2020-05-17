import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';

// ...
const String kGoogleApiKey = 'AIzaSyACitlfFOAbo-nnoakhfcZcfqcoV7N-Fq4';
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class BasicDateField extends StatefulWidget {
  const BasicDateField({Key key}) : super(key: key);
  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  _BasicDateField createState() => new _BasicDateField();
}

class _BasicDateField extends State<BasicDateField> {
  final format = DateFormat("yyyy-MM-dd");
  final tformat = DateFormat("HH:mm");

  PickResult pickupPlace;
  PickResult destPlace;
  String kGoogleApiKey = 'AIzaSyACitlfFOAbo-nnoakhfcZcfqcoV7N-Fq4';

  final GlobalKey<FormState> _bookingFormKey = GlobalKey<FormState>();
  TextEditingController dateController;
  TextEditingController timeController;

  FirebaseUser currentUser;

  void showDialog1() {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success!"),
          content: new Text("You have successfully get ride"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.pushNamed(context, "/home");
                dateController.clear();
                timeController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  initState() {
    dateController = new TextEditingController();
    timeController = new TextEditingController();
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'DUMAPOHEALTH',
            style: TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _bookingFormKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  DateTimeField(
                    decoration: InputDecoration(
                      labelText: 'Select date*',
                      hintText: "(${format.pattern})",
                      border: new OutlineInputBorder(),
                    ),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                    controller: dateController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DateTimeField(
                    decoration: InputDecoration(
                      labelText: 'Select pickup time*',
                      hintText: "(${tformat.pattern})",
                      border: new OutlineInputBorder(),
                    ),
                    format: tformat,
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.convert(time);
                    },
                    controller: timeController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 50.0,
                          color: Colors.black12,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlacePicker(
                                      apiKey: kGoogleApiKey,
                                      initialPosition:
                                          BasicDateField.kInitialPosition,
                                      useCurrentLocation: true,
                                      //usePlaceDetailSearch: true,
                                      onPlacePicked: (result) {
                                        pickupPlace = result;
                                        Navigator.of(context).pop();
                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        pickupPlace == null
                            ? Container(
                                child: Text('Select pickup place!'),
                              )
                            : Flexible(
                                child: Text(
                                  pickupPlace.formattedAddress ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 80.0,
                          height: 50.0,
                          color: Colors.black12,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return PlacePicker(
                                      apiKey: kGoogleApiKey,
                                      initialPosition:
                                          BasicDateField.kInitialPosition,
                                      useCurrentLocation: true,
                                      //usePlaceDetailSearch: true,
                                      onPlacePicked: (result) {
                                        destPlace = result;
                                        Navigator.of(context).pop();
                                        setState(() {});
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        destPlace == null
                            ? Container(
                                child: Text('Select destination place!'),
                              )
                            : Flexible(
                                child: Text(
                                  destPlace.formattedAddress ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                      child: Text("Submit"),
                      splashColor: Colors.blue[50],
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.black)),
                      color: Colors.white,
                      textColor: Color(0xFF0074E4),
                      onPressed: () {
                        if (pickupPlace.formattedAddress.isNotEmpty &&
                            destPlace.formattedAddress.isNotEmpty) {
                          Firestore.instance
                              .collection("users")
                              .document(currentUser.uid)
                              .collection('tasks')
                              .add({
                                "booking_date": dateController.text,
                                "booking_time": timeController.text,
                                "pickup_place": pickupPlace.formattedAddress,
                                "drop_place": destPlace.formattedAddress,
                              })
                              .then((result) => {
                                    showDialog1(),
                                  })
                              .catchError((err) => print(err));
                        }
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
