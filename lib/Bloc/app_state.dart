import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:persebaran_umkm/model/toko_model.dart';
import 'package:persebaran_umkm/model/umkm_model/data_list_umkm.dart';
import 'package:persebaran_umkm/model/user/data_user.dart';
import 'package:persebaran_umkm/model/user/user.dart';

@immutable
abstract class TokoState extends Equatable {}

//data loading state
class TokoLoadingState extends TokoState {
  @override
  List<Object?> get props => [];
}

//data loaded state
class TokoLoadedState extends TokoState {
  TokoLoadedState(this.umkms);
  final List<DataListUmkm>? umkms;

  @override
  List<Object?> get props => [umkms];
}

//data error state
class TokoErrorState extends TokoState {
  TokoErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}

//Login State
class UserLoadedState extends TokoState {
  UserLoadedState(this.user);
  final UserModel user;

  @override
  List<Object?> get props => [user];
}

class UserErrorState extends TokoState {
  UserErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
