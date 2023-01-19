import 'data_user.dart';

class UserModel {
  bool? success;
  String? message;
  DataUser? dataUser;

  UserModel({this.success, this.message, this.dataUser});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
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
