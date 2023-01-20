import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persebaran_umkm/Bloc/app_blocs.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/common/style.dart';
import 'package:persebaran_umkm/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _passwordVisible = true;

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
    _passwordVisible = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 36.0, horizontal: 18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: primaryColor,
                  ),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: const BorderSide(color: primaryColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.password,
                      color: primaryColor,
                    ),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: const BorderSide(color: primaryColor),
                    ),
                    suffixIcon: IconButton(
                      color: primaryColor,
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    )),
                obscureText: !_passwordVisible,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 15,
              ),
              BlocConsumer<TokoBlocs, TokoState>(listener: (context, state) {
                if (state is UserLoadedState) {
                  debugPrint("Berhasil Login");
                  context.read<TokoBlocs>().add(LoadTokoEvent());
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return Home(lat: lat, long: long);
                  }));
                }
                if (state is UserErrorState) {
                  debugPrint("Gagal Login");
                }
              }, builder: (context, state) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                        ),
                        onPressed: () async {
                          context.read<TokoBlocs>().add(LoadUserEvent(
                              emailController.text, passwordController.text));
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          pref.setString("email", "");
                        },
                        child: const Text("Login")),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
