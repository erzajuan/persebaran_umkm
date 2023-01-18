import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persebaran_umkm/Bloc/app_event.dart';
import 'package:persebaran_umkm/Bloc/app_state.dart';
import 'package:persebaran_umkm/model/toko_model.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/model/umkm_model/umkm_model.dart';

import '../common/service.dart';

class TokoBlocs extends Bloc<TokoEvents, TokoState> {
  TokoBlocs() : super(TokoLoadingState()) {
    List<DataListUmkm>? listUmkm = [];
    on<LoadTokoEvent>((event, emit) async {
      emit(TokoLoadingState());
      listUmkm = await UserRepository().getUsers();
      try {
        debugPrint("load toko event");
        final umkm = tokoList;
        emit(TokoLoadedState(umkm));
      } catch (e) {
        emit(TokoErrorState(e.toString()));
      }
    });
    on<LoadUserEvent>((event, emit) async {
      try {
        final user =
            await UserRepository().authLogin(event.email, event.password);
        emit(UserLoadedState(user));
      } catch (e) {
        emit(UserErrorState(e.toString()));
      }
    });
    on<SearchTokoEvent>(
      (event, emit) async {
        // final suggestion = listUmkm!.where((toko) {
        //   final judul = toko.name.toLowerCase();
        //   final input = event.query.toLowerCase();

        //   return judul.contains(input);
        // }).toList();

        final suggestions = tokoList.where((toko) {
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
