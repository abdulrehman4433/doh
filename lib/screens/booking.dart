import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:dart_math/dart_math.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:geocoder/geocoder.dart';

// ...
const String kGoogleApiKey = 'AIzaSyACitlfFOAbo-nnoakhfcZcfqcoV7N-Fq4';
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class BasicDateField extends StatefulWidget {

  @override
  _BasicDateField createState() => new _BasicDateField();
}

class _BasicDateField extends State<BasicDateField> {
  final format = DateFormat("yyyy-MM-dd");
  final tformat = DateFormat("HH:mm");

  final GlobalKey<FormState> _bookingFormKey = GlobalKey<FormState>();
  TextEditingController dateController;
  TextEditingController timeController;
  TextEditingController pickupController;
  TextEditingController destinationController;

  FirebaseUser currentUser;

  @override
  initState() {
    dateController = new TextEditingController();
    timeController = new TextEditingController();
    pickupController = new TextEditingController();
    destinationController = new TextEditingController();
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
            title: Text('DUMPOHEALTH',
            style:TextStyle(
              fontFamily: 'Philosopher',
              fontWeight: FontWeight.w700,
            ),),
            backgroundColor: Colors.black,
          ),
          body: Container(
            padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: _bookingFormKey,
                child: Column(children: <Widget>[
                  DateTimeField(
                    decoration: InputDecoration(
                      labelText: 'Select date*',
                      hintText: "(${format.pattern})",
                      border: new OutlineInputBorder(),),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                    controller:  dateController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DateTimeField(
                    decoration: InputDecoration(
                      labelText: 'Select pickup time*',
                      hintText: "(${tformat.pattern})",
                      border: new OutlineInputBorder(),),
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

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Pickup address*', hintText: "Pickup address",
                      border: new OutlineInputBorder(),),

                    onTap: () async {
                      // show input autocomplete with selected mode
                      // then get the Prediction selected
                      Prediction p = await PlacesAutocomplete.show(
                        context: context, apiKey: kGoogleApiKey,
                        mode: Mode.overlay, language: "en",);
                      displayPrediction(p);
                      print(p);
                    },
                    controller: pickupController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Destination address*', hintText: "Clinic address",
                      border: new OutlineInputBorder(),),

                    onTap: () async {
                      // show input autocomplete with selected mode
                      // then get the Prediction selected
                      Prediction p = await PlacesAutocomplete.show(
                          context: context,
                          apiKey: kGoogleApiKey,
                          mode: Mode.overlay);
                      displayPrediction(p);
                      return displayPrediction(p);
                    },
                    controller: destinationController,
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
            if (pickupController.text.isNotEmpty &&
                destinationController.text.isNotEmpty) {
              Firestore.instance
                  .collection("users")
                  .document(currentUser.uid)
                  .collection('tasks')
                  .add({
                "booking_date": dateController.text,
                "booking_time": timeController.text,
                "pickup_place": pickupController.text,
                "drop_place": destinationController.text,
              })
                  .then((result) => {
                Navigator.pop(context),
                pickupController.clear(),
                destinationController.clear(),
              })
                  .catchError((err) => print(err));
            }
          }
      ),

                ],
                ),

              ),
            ),
          )
      );
    }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      PlacesDetailsResponse detail =
      await _places.getDetailsByPlaceId(p.placeId);

      var placeId = p.placeId;
      double lat = detail.result.geometry.location.lat;
      double lng = detail.result.geometry.location.lng;

      var address = await Geocoder.local.findAddressesFromQuery(p.description);

      print(lat);
      print(lng);
    }
  }


}
