import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:persebaran_umkm/Bloc/app_blocs.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/common/style.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateUmkm extends StatefulWidget {
  const CreateUmkm({super.key});

  @override
  State<CreateUmkm> createState() => _CreateUmkmState();
}

class _CreateUmkmState extends State<CreateUmkm> {
  final namaController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();
  final openDaysController = TextEditingController();
  final openTimeController = TextEditingController();
  final longController = TextEditingController();
  final latController = TextEditingController();
  final linkGambarController = TextEditingController();
  final linkMenuController = TextEditingController();

  List data = [];
  double long = 0;
  double lat = 0;
  var id;

  Future<void> sharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.getString("id")!;
    setState(() {});
  }

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
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  labelText: "Nama UMKM",
                  hintText: "Masukan Nama UMKM",
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
                controller: locationController,
                decoration: InputDecoration(
                  labelText: "Lokasi UMKM",
                  hintText: "Masukan Lokasi UMKM",
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
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Deskripsi UMKM",
                  hintText: "Masukan Deskripsi UMKM",
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
                controller: openDaysController,
                decoration: InputDecoration(
                  labelText: "Hari Buka UMKM",
                  hintText: "Masukan Hari Buka UMKM",
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
                controller: openTimeController,
                decoration: InputDecoration(
                  labelText: "Jam Buka UMKM",
                  hintText: "Masukan Jam Buka UMKM",
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
                controller: longController,
                decoration: InputDecoration(
                  labelText: "Longitude UMKM",
                  hintText: "Koordinat Longitude UMKM",
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
                controller: latController,
                decoration: InputDecoration(
                  labelText: "Latitude UMKM",
                  hintText: "Koordinat Latitude UMKM",
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
                controller: linkGambarController,
                decoration: InputDecoration(
                  labelText: "Link Gambar UMKM",
                  hintText: "Masukan Link Gambar UMKM",
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
                controller: linkMenuController,
                decoration: InputDecoration(
                  labelText: "Link Menu UMKM",
                  hintText: "Masukan Link Menu UMKM",
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
                  if (state is TokoCreateState) {
                    context.read<TokoBlocs>().add(LoadTokoEvent());
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Home(lat: lat, long: long);
                    }));
                  }
                  // if (state is TokoErrorState) {

                  // }
                },
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: () {
                        sharedPreferences();
                        context.read<TokoBlocs>().add(CreateTokoEvent(
                            id,
                            namaController.text,
                            locationController.text,
                            descriptionController.text,
                            openDaysController.text,
                            openTimeController.text,
                            longController.text,
                            latController.text,
                            linkGambarController.text,
                            linkMenuController.text));
                      },
                      child: Text("Daftarkan"));
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
