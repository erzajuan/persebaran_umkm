class DataUser {
  String id;
  String email;
  String nama;
  String userLevel;
  String noTelp;

  DataUser(
      {required this.id,
      required this.email,
      required this.nama,
      required this.userLevel,
      required this.noTelp});

  factory DataUser.fromJson(Map<String, dynamic> json) => DataUser(
        id: json['id'] as String,
        email: json['email'] as String,
        nama: json['nama'] as String,
        userLevel: json['user_level'] as String,
        noTelp: json['no_telp'] as String,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'nama': nama,
        'user_level': userLevel,
        'no_telp': noTelp,
      };
}
