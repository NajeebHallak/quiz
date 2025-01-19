import 'package:hive/hive.dart';

part 'crest_or_login_user_entities.g.dart';

@HiveType(typeId: 0)
class CreatOrLoginUserEntites {
  @HiveField(0)
  final num? id1;
  @HiveField(1)
  final String token1;
  CreatOrLoginUserEntites({this.id1, required this.token1});
}
