// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    userId: json['userId'] as String,
    userName: json['userName'] as String,
    ifMale: json['ifMale'] as bool,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatarUrl': instance.avatarUrl,
      'userId': instance.userId,
      'userName': instance.userName,
      'ifMale': instance.ifMale,
    };
