import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persebaran_umkm/Bloc/app_blocs.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/common/style.dart';

class RegisterPage extends StatelessWidget {
  final namaController = TextEditingController();
  final noTelpController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: "Nama",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: primaryColor),
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: primaryColor),
                ),
              ),
            ),
            TextField(
              controller: noTelpController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: "No Telepon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: primaryColor),
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: const BorderSide(color: primaryColor),
                ),
              ),
            ),
            BlocConsumer<TokoBlocs, TokoState>(listener: (context, state) {
              if (state is UserLoadedState) {
                debugPrint("Berhasil Login");
              }
              if (state is UserErrorState) {
                debugPrint("Gagal Login");
              }
            }, builder: (context, state) {
              return ElevatedButton(
                  onPressed: () {
                    context.read<TokoBlocs>().add(LoadUserEvent(
                        emailController.text, passwordController.text));
                  },
                  child: const Text("Login"));
            })
          ],
        ),
      ),
    );
  }
}
