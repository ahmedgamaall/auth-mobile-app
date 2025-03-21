import 'package:json_annotation/json_annotation.dart';
part 'register_request_body.g.dart';

@JsonSerializable()
class RegisterRequestBody {
  final String email;
  final String username;
  final String password;

  RegisterRequestBody({
    required this.email,
    required this.password,
    required this.username,
  });

  Map<String, dynamic> toJson() => _$RegisterRequestBodyToJson(this);
}
