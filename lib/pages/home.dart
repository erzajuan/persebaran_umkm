import 'package:flutter/material.dart';
import 'package:persebaran_umkm/model/toko_model.dart';
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
        ),
        body: TourismPlaceList(lat: lat, long: long));
  }
}

class TourismPlaceList extends StatefulWidget {
  final double lat;
  final double long;

  const TourismPlaceList({super.key, required this.lat, required this.long});

  @override
  State<TourismPlaceList> createState() => _TourismPlaceListState();
}

class _TourismPlaceListState extends State<TourismPlaceList> {
  final controller = TextEditingController();

  List<Toko> umkm = tokoList;

  void Search(String query) {
    final suggestion = tokoList.where((toko) {
      final judul = toko.name.toLowerCase();
      final input = query.toLowerCase();

      return judul.contains(input);
    }).toList();

    setState(() => umkm = suggestion);
  }

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
            onChanged: Search,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: umkm.length,
            itemBuilder: (_, index) {
              final umkms = umkm[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Detail(
                      umkm: umkms,
                      lat: widget.lat,
                      long: widget.long,
                    );
                  }));
                },
                child: Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          umkms.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                umkms.name,
                                style: heading1,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                umkms.location,
                                style: body,
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${(Geolocator.distanceBetween(umkms.lat, umkms.long, widget.lat, widget.long) / 1000).truncateToDouble()} KM",
                                style: body,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
