import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double long = 0;
  double lat = 0;

  void getCurretLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    long = position.longitude;
    lat = position.latitude;

    setState(() {});
  }

  @override
  void initState() {
    getCurretLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persebaran UMKM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(lat: lat, long: long),
    );
    // home: SplashScreen(),
  }
}