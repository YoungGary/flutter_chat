// name id age sex... 
import 'package:json_annotation/json_annotation.dart';
part 'userModel.g.dart';
@JsonSerializable()
class UserModel {
  UserModel({this.userId, this.userName,this.ifMale,this.avatarUrl});
  String avatarUrl;
  String userId;
  String userName;
  bool ifMale;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}