import 'package:flutter/material.dart';
import 'register.dart';
import 'splash.dart';
import 'login.dart';
import 'home.dart';
import 'signup_decision.dart';
import 'driver_register.dart';
import 'admin_login.dart';
import 'admin_dashboard.dart';
import 'screens/admin_booking_detail.dart';
import 'screens/admin_driver_detail.dart';
import 'screens/admin_booking_subdetail.dart';
import 'screens/onboarding.dart';
import 'screens/services.dart';
import 'screens/vehicles.dart';
import 'screens/requirements.dart';
import 'screens/choose.dart';
import 'screens/contact.dart';
import 'screens/booking.dart';
import 'screens/booking_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DUMAPOHEALTH',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Philosopher',
        ),
        home: SplashPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomePage(),
          '/login': (BuildContext context) => LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
          '/onboarding': (BuildContext context) => Onboarding(),
          '/services': (BuildContext Context) => Services(),
          '/vehicles': (BuildContext Context) => Vehicles(),
          '/requirements': (BuildContext Context) => Requirements(),
          '/choose': (BuildContext Context) => Choose(),
          '/contact': (BuildContext Context) => Contact(),
          '/siginupdecision': (BuildContext Context) => Decision(),
          '/booking': (BuildContext Context) => BasicDateField(),
          '/bookingDetail': (BuildContext Context) => BookingDetail(),
          '/driverregister': (BuildContext Context) => DriverRegister(),
          '/admin_login': (BuildContext Context) => AdminLogin(),
          '/admin_dashboard': (BuildContext Context) => AdminDashboard(),
          '/admin_booking': (BuildContext Context) => AdminBookingDetail(),
          '/admin_subdetail': (BuildContext Context) => AdminBookingSubDetail(),
          '/admin_driver': (BuildContext Context) => AdminDriverDetail(),
        });
  }
}