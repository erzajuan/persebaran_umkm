import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persebaran_umkm/Bloc/app_blocs.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/common/style.dart';
import 'package:persebaran_umkm/pages/login.dart';

class RegisterPage extends StatelessWidget {
  final namaController = TextEditingController();
  final noTelpController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 36.0, horizontal: 18.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Masukan Nama Anda",
                    style: heading1,
                  ),
                  TextField(
                    controller: namaController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                      hintText: "Nama",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Masukan Email Anda",
                    style: heading1,
                  ),
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
                  Text(
                    "Masukan Password Anda",
                    style: heading1,
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
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Masukan No Telpon Anda",
                    style: heading1,
                  ),
                  TextField(
                    controller: noTelpController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: primaryColor,
                      ),
                      hintText: "No Telepon",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: const BorderSide(color: primaryColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  BlocConsumer<TokoBlocs, TokoState>(
                      listener: (context, state) {
                    if (state is RegisterState) {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                          (Route<dynamic> route) => false);
                    }
                    if (state is UserErrorState) {
                      debugPrint("Gagal Login");
                    }
                  }, builder: (context, state) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: SizedBox(
                        height: 40,
                        width: 300,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () async {
                              context.read<TokoBlocs>().add(UserRegistrasiEvent(
                                    namaController.text,
                                    emailController.text,
                                    passwordController.text,
                                    noTelpController.text,
                                  ));
                            },
                            child: const Text("Register")),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
