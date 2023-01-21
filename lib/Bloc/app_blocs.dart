import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/service.dart';

class TokoBlocs extends Bloc<TokoEvents, TokoState> {
  TokoBlocs() : super(TokoLoadingState()) {
    List<DataListUmkm>? listUmkm = [];

    on<LoadTokoEvent>((event, emit) async {
      debugPrint("LoadTokoEvent");
      listUmkm = await UserRepository().getUmkm();
      emit(TokoLoadingState());
      try {
        debugPrint("load toko event");
        emit(TokoLoadedState(listUmkm));
      } catch (e) {
        emit(TokoErrorState(e.toString()));
      }
    });

    on<LoadUserEvent>((event, emit) async {
      try {
        final user =
            await UserRepository().authLogin(event.email, event.password);
        if (user!.success!) {
          SharedPreferences pref = await SharedPreferences.getInstance();
          pref.setString("id", user.dataUser!.id);
          pref.setString("email", user.dataUser!.email);
          pref.setString("nama", user.dataUser!.nama);
          pref.setString("no_telp", user.dataUser!.noTelp);
          pref.setString("user_level", user.dataUser!.userLevel);
          emit(UserLoadedState(user));
        } else {
          emit(UserErrorState(user.message!));
        }
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });

    on<CreateTokoEvent>((event, emit) async {
      listUmkm = await UserRepository().getUmkm();
      try {
        final create = await UserRepository().createUmkm(
            event.idUser,
            event.nama,
            event.location,
            event.description,
            event.openDays,
            event.openTime,
            event.long,
            event.lat,
            event.linkGambar,
            event.linkMenu);
        emit(TokoCreateState());
      } catch (e) {
        emit(TokoErrorState(e.toString()));
      }
    });

    on<SearchTokoEvent>(
      (event, emit) async {
        final suggestions = listUmkm!.where((toko) {
          final judul = toko.name.toLowerCase();
          final input = event.query.toLowerCase();

          return judul.contains(input);
        }).toList();
        debugPrint("Sudah Emit");
        emit(TokoLoadedState(suggestions));
      },
    );
  }
}
