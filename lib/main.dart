import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persebaran_umkm/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bloc/app_blocs.dart';
import 'Bloc/app_event.dart';
import 'pages/home.dart';

Future<void> main() async {
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

  String email = "";

  void getCurretLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    long = position.longitude;
    lat = position.latitude;

    setState(() {});
  }

  Future<String> sharedPreferences() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("email")!;
    return email;
  }

  @override
  void initState() {
    getCurretLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sharedPreferences();
    return BlocProvider<TokoBlocs>(
        create: (BuildContext context) => TokoBlocs()..add(LoadTokoEvent()),
        child: MaterialApp(
          title: 'Persebaran UMKM',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: email == "" ? const LoginPage() : Home(lat: lat, long: long),
        ));
    // home: SplashScreen(),
  }
}
