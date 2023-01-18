import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persebaran_umkm/common/style.dart';
import 'package:persebaran_umkm/model/toko_model.dart';
import 'package:persebaran_umkm/pages/tracking.dart';

class Detail extends StatelessWidget {
  final Toko umkm;
  // final DataListUmkm umkms;
  final double lat;
  final double long;

  const Detail({
    super.key,
    required this.umkm,
    required this.lat,
    required this.long,
    // required this.umkms
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return DetailMobilePage(
          umkm: umkm,
          // umkms: umkms,
          lat: lat,
          long: long,
        );
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final Toko umkm;
  // final DataListUmkm umkms;
  final double lat;
  final double long;

  const DetailMobilePage({
    super.key,
    required this.umkm,
    required this.lat,
    required this.long,
    // required this.umkms
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 370,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(18),
                      ),
                      child: Image.asset(
                        umkm.imageAsset,
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Tracking(
                                      destination: LatLng(umkm.lat, umkm.long
                                          // double.parse(umkm.lat),
                                          // double.parse(umkm.long)
                                          ),
                                      sourceLocation: LatLng(lat, long),
                                    );
                                  }));
                                },
                                icon: const Icon(Icons.map),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Container(
                            height: 90,
                            width: 280,
                            color: primaryColor,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Column(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.calendar_today,
                                            color: whiteColor,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            umkm.openDays,
                                            style:
                                                body.apply(color: whiteColor),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          const Icon(
                                            Icons.access_time,
                                            color: whiteColor,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            umkm.openTime,
                                            style:
                                                body.apply(color: whiteColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                child: Text(umkm.name,
                    textAlign: TextAlign.center,
                    style: heading1.apply(fontSizeDelta: 16)),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  umkm.description,
                  textAlign: TextAlign.center,
                  style: body,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Menu",
                  style: heading1,
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    final menu = umkm.imageUrls[index];
                    return SizedBox(
                      height: 300,
                      child: Card(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 6,
                              child: Image.asset(
                                menu.gambar,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                menu.nama,
                                style: heading2.apply(color: primaryColor),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                menu.harga,
                                style: body,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  itemCount: umkm.imageUrls.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
