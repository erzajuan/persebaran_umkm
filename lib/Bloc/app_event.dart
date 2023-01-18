import 'package:equatable/equatable.dart';

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
