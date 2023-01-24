import 'package:equatable/equatable.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';

abstract class TokoEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadTokoEvent extends TokoEvents {
  @override
  List<Object?> get props => [];
}

//Search
class SearchTokoEvent extends TokoEvents {
  final String query;

  SearchTokoEvent(this.query);
  @override
  List<Object?> get props => [query];
}

//Auth
class LoadTokoUserEvent extends TokoEvents {
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

//Create
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

class UpdateTokoEvent extends TokoEvents {
  final String id;
  final String status;

  UpdateTokoEvent(
    this.id,
    this.status,
  );

  @override
  List<Object?> get props => [];
}

class UserTokoEvent extends TokoEvents {
  @override
  List<Object?> get props => [];
}
