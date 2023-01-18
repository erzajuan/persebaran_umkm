import 'data_list_umkm.dart';

class UmkmModel {
  List<DataListUmkm>? dataListUmkm;
  bool? success;
  String? message;

  UmkmModel({this.dataListUmkm, this.success, this.message});

  factory UmkmModel.fromJson(Map<String, dynamic> json) => UmkmModel(
        dataListUmkm: (json['data_list_umkm'] as List<dynamic>?)
            ?.map((e) => DataListUmkm.fromJson(e as Map<String, dynamic>))
            .toList(),
        success: json['success'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'data_list_umkm': dataListUmkm?.map((e) => e.toJson()).toList(),
        'success': success,
        'message': message,
      };
}
