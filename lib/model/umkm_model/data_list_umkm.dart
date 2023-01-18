class DataListUmkm {
  String id;
  String name;
  String location;
  String description;
  String openDays;
  String openTime;
  String long;
  String lat;
  String idImageAsset;
  // String harga;
  // String gambar;
  // String nama;

  DataListUmkm({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.long,
    required this.lat,
    required this.idImageAsset,
    // required this.harga,
    // required this.gambar,
    // required this.nama,
  });

  factory DataListUmkm.fromJson(Map<String, dynamic> json) => DataListUmkm(
        id: json['id'] as String,
        name: json['name'] as String,
        location: json['location'] as String,
        description: json['description'] as String,
        openDays: json['openDays'] as String,
        openTime: json['openTime'] as String,
        long: json['long'] as String,
        lat: json['lat'] as String,
        idImageAsset: json['id_image_asset'] as String,
        // harga: json['harga'] as String,
        // gambar: json['gambar'] as String,
        // nama: json['nama'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'location': location,
        'description': description,
        'openDays': openDays,
        'openTime': openTime,
        'long': long,
        'lat': lat,
        'id_image_asset': idImageAsset,
        // 'harga': harga,
        // 'gambar': gambar,
        // 'nama': nama,
      };
}
