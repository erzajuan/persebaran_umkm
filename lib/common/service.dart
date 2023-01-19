import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/model/user/data_user.dart';
import 'package:persebaran_umkm/model/user/user.dart';

class UserRepository {
  String endpoint =
      "http://192.168.1.12/Coba/public/index.php/Api/UMKM/getUmkm";
  Future<List<DataListUmkm>?> getUmkm() async {
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
    return null;
  }

  String endpointUmkmUser =
      "http://192.168.1.12/Coba/public/index.php/Api/UMKM/getUmkmUser";
  Future<List<DataListUmkm>?> getUmkmUsers() async {
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
    return null;
  }

  String endpointGetStatus =
      "http://192.168.1.12/Coba/public/index.php/Api/UMKM/getStatus";
  Future<List<DataListUmkm>?> getStatus() async {
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
    return null;
  }

  String endpointCreateUmkm =
      "http://192.168.1.12/Coba/public/index.php/Api/UMKM/createUmkm";
  Future<List<DataListUmkm>?> createUmkm() async {
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
    return null;
  }

  String endpointUpdate =
      "http://192.168.1.12/Coba/public/index.php/Api/UMKM/createUmkm";
  Future<List<DataListUmkm>?> update() async {
    try {
      Response response = await get(Uri.parse(endpoint));
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

  String endpointLogin =
      "http://192.168.1.12/Coba/public/index.php/Api/Auth/login";
  Future<UserModel?> authLogin(email, password) async {
    try {
      Response response = await post(Uri.parse(endpointLogin),
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
