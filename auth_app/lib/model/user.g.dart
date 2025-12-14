// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
  id: (json['id'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  age: (json['age'] as num).toInt(),
  gender: json['gender'] as String,
  email: json['email'] as String,
  phone: json['phone'] as String,
  username: json['username'] as String,
  password: json['password'] as String,
  birthDate: json['birthDate'] as String,
  imageUrl: json['image'] as String,
  bloodGroup: json['bloodGroup'] as String,
  height: (json['height'] as num).toDouble(),
  weight: (json['weight'] as num).toDouble(),
  eyeColor: json['eyeColor'] as String,
  university: json['university'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'age': instance.age,
  'gender': instance.gender,
  'email': instance.email,
  'phone': instance.phone,
  'username': instance.username,
  'password': instance.password,
  'birthDate': instance.birthDate,
  'image': instance.imageUrl,
  'bloodGroup': instance.bloodGroup,
  'height': instance.height,
  'weight': instance.weight,
  'eyeColor': instance.eyeColor,
  'university': instance.university,
};
