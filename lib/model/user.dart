import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  List<User> users;
  int total;
  int skip;
  int limit;

  UserModel(
      {required this.users,
      required this.total,
      required this.skip,
      required this.limit});

  factory UserModel.fromJson(Map<String, dynamic> map) =>
      _$UserModelFromJson(map);

  Map<String, dynamic> toMap() => _$UserModelToJson(this);
}

@JsonSerializable()
class User {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email});

  factory User.fromJson(Map<String, dynamic> map) => _$UserFromJson(map);

  Map<String, dynamic> toMap() => _$UserToJson(this);
}
