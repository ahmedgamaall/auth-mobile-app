import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String image;

  UserDataResponse({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.image,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);
}
