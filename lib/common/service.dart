import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/model/user/data_user.dart';

class UserRepository {
  String endpoint =
      "http://192.168.0.109/Coba/public/index.php/Api/UMKM/getUmkm";
  Future<List<DataListUmkm>?> getUsers() async {
    try {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        debugPrint("response get users ${response.body}");
        final List result = jsonDecode(response.body)['data_list_umkm'];
        return result.map((e) => DataListUmkm.fromJson(e)).toList();
      } else {
        debugPrint("throw error get users ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Catch Error getUsers $e");
    }
  }

  String endpointLogin =
      "http://192.168.0.246/Coba/public/index.php/Api/Auth/login";
  Future<List<DataUser>?> authLogin(email, password) async {
    try {
      Response response = await post(Uri.parse(endpoint),
          body: {'email': '$email', 'password': '$password'});
      if (response.statusCode == 200) {
        debugPrint("response get users ${response.body}");
        final List result = jsonDecode(response.body)['data_list_umkm'];
        return result.map((e) => DataUser.fromJson(e)).toList();
      } else {
        debugPrint("throw error get users ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Catch Error getUsers $e");
    }
  }
}
