import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:persebaran_umkm/model/basic_model.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/model/user/user.dart';

class UserRepository {
  String api = "http://172.20.10.6";

  String endpointGetUmkm = "/Coba/public/index.php/Api/UMKM/getUmkm";
  Future<List<DataListUmkm>?> getUmkm() async {
    try {
      Response response = await get(Uri.parse(api + endpointGetUmkm));
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
    return null;
  }

  String endpointGetUmkmUser = "/Coba/public/index.php/Api/UMKM/getUmkmUser";
  Future<List<DataListUmkm>?> getUmkmUsers() async {
    try {
      Response response = await get(Uri.parse(api + endpointGetUmkmUser));
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
    return null;
  }

  String endpointGetStatus = "/Coba/public/index.php/Api/UMKM/getStatus";
  Future<List<DataListUmkm>?> getStatus() async {
    try {
      Response response = await get(Uri.parse(api + endpointGetStatus));
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
    return null;
  }

  String endpointCreateUmkm = "/Coba/public/index.php/Api/UMKM/createUmkm";
  Future<BasicModel?> createUmkm(id, name, location, description, openDays,
      openTime, long, lat, linkGambar, linkMenu) async {
    try {
      Response response =
          await post(Uri.parse(api + endpointCreateUmkm), body: {
        "id_user": "$id",
        "name": "$name",
        "location": "$location",
        "description": "$description",
        "openDays": "$openDays",
        "openTime": "$openTime",
        "long": "$long",
        "lat": "$lat",
        "link_gambar": "$linkGambar",
        "link_menu": "$linkMenu"
      });
      if (response.statusCode == 200) {
        debugPrint("response create UMKM ${response.body}");
        final result = jsonDecode(response.body);
        return BasicModel.fromJson(result);
      } else {
        debugPrint("throw error get users ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Catch Error getUsers $e");
    }
    return null;
  }

  String endpointUpdate = "/Coba/public/index.php/Api/UMKM/updateStatus";
  Future<List<DataListUmkm>?> update() async {
    try {
      Response response = await get(Uri.parse(api + endpointUpdate));
      if (response.statusCode == 200) {
        debugPrint("response get users ${response.body}");
        final List result = jsonDecode(response.body)['data_list_umkm'];
        return result.map((e) => DataListUmkm.fromJson(e)).toList();
      } else {
        debugPrint("throw error get upda ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Catch Error getUsers $e");
    }
    return null;
  }

  String endpointLogin = "/Coba/public/index.php/Api/Auth/login";
  Future<UserModel?> authLogin(email, password) async {
    try {
      Response response = await post(Uri.parse(api + endpointLogin),
          body: {'email': '$email', 'password': '$password'});
      if (response.statusCode == 200) {
        debugPrint("response get users login ${response.body}");
        final result = jsonDecode(response.body);
        return UserModel.fromJson(result);
      } else {
        debugPrint("throw error get users login ${response.reasonPhrase}");
      }
    } catch (e) {
      debugPrint("Catch Error getUsers $e");
    }
    return null;
  }
}
