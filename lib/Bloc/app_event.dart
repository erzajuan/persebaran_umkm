import 'package:equatable/equatable.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';

abstract class TokoEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchTokoEvent extends TokoEvents {
  final String query;

  SearchTokoEvent(this.query);
  @override
  List<Object?> get props => [query];
}

class LoadTokoEvent extends TokoEvents {
  @override
  List<Object?> get props => [];
}

class LoadUserEvent extends TokoEvents {
  final String email;
  final String password;

  LoadUserEvent(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class CreateTokoEvent extends TokoEvents {
  final String idUser;
  final String nama;
  final String location;
  final String description;
  final String openDays;
  final String openTime;
  final String long;
  final String lat;
  final String linkGambar;
  final String linkMenu;

  CreateTokoEvent(
      this.idUser,
      this.nama,
      this.location,
      this.description,
      this.openDays,
      this.openTime,
      this.long,
      this.lat,
      this.linkGambar,
      this.linkMenu);

  @override
  List<Object?> get props => [
        idUser,
        nama,
        location,
        description,
        openDays,
        openTime,
        long,
        lat,
        linkGambar,
        linkMenu
      ];
}
