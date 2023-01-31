import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/common/service.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/pages/home.dart';
import 'package:persebaran_umkm/pages/profile.dart';
import '../Bloc/app_blocs.dart';
import '../common/style.dart';
import 'detail.dart';
import 'package:geolocator/geolocator.dart';

class Status extends StatelessWidget {
  final double lat;
  final double long;

  const Status({super.key, required this.lat, required this.long});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("UMKM Semarang",
              style: TextStyle(color: Colors.white, fontSize: 22)),
          backgroundColor: primaryColor,
        ),
        body: StatusList(lat: lat, long: long));
  }
}

class StatusList extends StatelessWidget {
  final double lat;
  final double long;
  final controller = TextEditingController();

  StatusList({super.key, required this.lat, required this.long});

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
                return const Center(child: CircularProgressIndicator());
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
                              Expanded(
                                flex: 1,
                                child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(18),
                                        bottomRight: Radius.circular(18)),
                                    child: Image.network(
                                        umkms![index].link_gambar)),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            umkms[index].name,
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
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            umkms[index].status,
                                            style: heading2,
                                          )
                                        ],
                                      ),
                                      umkms[index].status == "pending"
                                          ? BlocConsumer<TokoBlocs, TokoState>(
                                              listener: (context, state) {
                                              if (state is TokoUpdateState) {
                                                debugPrint(
                                                    "Berhasil Mengganti Status");
                                                context
                                                    .read<TokoBlocs>()
                                                    .add(LoadTokoUserEvent());
                                                Navigator.of(context)
                                                    .pushAndRemoveUntil(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Home(
                                                                    lat: lat,
                                                                    long:
                                                                        long)),
                                                        (Route<dynamic>
                                                                route) =>
                                                            false);
                                              }
                                            }, builder: (context, state) {
                                              return Expanded(
                                                child: IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<TokoBlocs>()
                                                          .add(UpdateTokoEvent(
                                                              umkms[index].id,
                                                              "approved"));
                                                    },
                                                    icon: const Icon(
                                                        Icons.check)),
                                              );
                                            })
                                          : const SizedBox()
                                    ],
                                  ),
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
                return Center(
                  child: Text(
                    "Terjadi Kesalahan",
                    style: heading1,
                  ),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
