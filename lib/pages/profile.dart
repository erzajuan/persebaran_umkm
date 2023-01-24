import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persebaran_umkm/Bloc/app_blocs.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/common/style.dart';
import 'package:persebaran_umkm/pages/create_umkm.dart';
import 'package:persebaran_umkm/pages/login.dart';
import 'package:persebaran_umkm/pages/status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var id = "";
  var email = "";
  var nama = "";
  var noTelp = "";
  var userLevel = "";

  Future<void> sharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id")!;
    email = prefs.getString("email")!;
    nama = prefs.getString("nama")!;
    noTelp = prefs.getString("no_telp")!;
    userLevel = prefs.getString("user_level")!;
    setState(() {});
  }

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
    sharedPreferences();
    getCurretLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    sharedPreferences();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                child: Row(
                  children: [
                    const Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          nama,
                          style: heading2,
                        ),
                        Text(
                          email,
                          style: heading2,
                        ),
                        Text(
                          noTelp,
                          style: heading2,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return CreateUmkm();
                  }));
                },
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Daftarkan UMKM",
                      style: heading2.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: blackColor,
                    )
                  ],
                ),
              ),
              nama == "admin"
                  ? InkWell(
                      onTap: () {
                        context.read<TokoBlocs>().add(LoadTokoUserEvent());
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Status(
                            lat: lat,
                            long: long,
                          );
                        }));
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Status UMKM",
                            style: heading2.copyWith(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 1,
                            color: blackColor,
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextButton(
                      onPressed: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.remove("email");
                        pref.remove("nama");
                        pref.remove("no_telp");
                        pref.remove("user_level");
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return const LoginPage();
                        }));
                      },
                      child: Text(
                        "Log Out",
                        style: heading1,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
