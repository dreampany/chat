// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['ui'] as String,
    json['name'] as String,
    json['photo_url'] as String,
    json['token'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.id,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'token': instance.token,
    };
