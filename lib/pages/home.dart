import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/model/toko_model.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/pages/profile.dart';
import '../Bloc/app_blocs.dart';
import '../common/style.dart';
import 'detail.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatelessWidget {
  final double lat;
  final double long;

  const Home({super.key, required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("UMKM Semarang",
                style: TextStyle(color: Colors.white, fontSize: 22)),
            backgroundColor: primaryColor,
            actions: [
              IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Profile();
                  }));
                },
              ),
            ]),
        body: TokoList(lat: lat, long: long));
  }
}

class TokoList extends StatelessWidget {
  final double lat;
  final double long;
  final controller = TextEditingController();

  TokoList({super.key, required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                color: primaryColor,
              ),
              hintText: "Cari UMKM",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: primaryColor),
              ),
            ),
            onChanged: (String query) {
              context.read<TokoBlocs>().add(SearchTokoEvent(query));
            },
          ),
        ),
        Expanded(
          child: BlocBuilder<TokoBlocs, TokoState>(
            builder: (context, state) {
              if (state is TokoLoadingState) {
                debugPrint("Loading State");
                return const CircularProgressIndicator();
              }
              if (state is TokoLoadedState) {
                return ListView.builder(
                  itemCount: state.umkms?.length,
                  itemBuilder: (_, index) {
                    List<DataListUmkm>? umkms = state.umkms;
                    var formatter = NumberFormat('#.##');
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Detail(
                            umkms: umkms[index],
                            lat: lat,
                            long: long,
                          );
                        }));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(18),
                                      bottomRight: Radius.circular(18)),
                                  child:
                                      Image.network(umkms![index].link_gambar)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      umkms![index].name,
                                      style: heading1,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      umkms[index].location,
                                      style: body,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "${formatter.format((Geolocator.distanceBetween(double.parse(umkms[index].lat), double.parse(umkms[index].long), lat, long) / 1000))} KM",
                                      style: body,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is TokoErrorState) {
                return const Center(
                  child: Text("Error"),
                );
              }
              return const Center(
                child: Text("Error"),
              );
            },
          ),
        ),
      ],
    );
  }
}
