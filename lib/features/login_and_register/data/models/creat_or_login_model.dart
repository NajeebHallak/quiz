import 'package:quiz/features/login_and_register/domain/entities/crest_or_login_user_entities.dart';

class CreatOrLoginModel extends CreatOrLoginUserEntites {
  num? id;
  String token;

  CreatOrLoginModel({this.id, required this.token})
      : super(id1: id, token1: token);

  factory CreatOrLoginModel.fromJson(Map<String, dynamic> json) {
    return CreatOrLoginModel(
      id: json['id'] as num?,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id1,
        'token': token1,
      };
}
