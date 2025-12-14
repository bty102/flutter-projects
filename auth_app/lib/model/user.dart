import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'firstName')
  String firstName;

  @JsonKey(name: 'lastName')
  String lastName;

  @JsonKey(name: 'age')
  int age;

  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'birthDate')
  String birthDate;

  @JsonKey(name: 'image')
  String imageUrl;

  @JsonKey(name: 'bloodGroup')
  String bloodGroup;

  @JsonKey(name: 'height')
  double height;

  @JsonKey(name: 'weight')
  double weight;

  @JsonKey(name: 'eyeColor')
  String eyeColor;

  @JsonKey(name: 'university')
  String university;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.imageUrl,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.university,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
