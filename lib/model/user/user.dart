import 'data_user.dart';

class User {
  bool? success;
  String? message;
  DataUser? dataUser;

  User({this.success, this.message, this.dataUser});

  factory User.fromJson(Map<String, dynamic> json) => User(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        dataUser: json['data_user'] == null
            ? null
            : DataUser.fromJson(json['data_user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data_user': dataUser?.toJson(),
      };
}
