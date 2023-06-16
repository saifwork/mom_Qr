import 'package:json_annotation/json_annotation.dart';
part 'FirebaseUserModel.g.dart';

@JsonSerializable()
class FirebaseUserModel {
  final String uId;
  final String name;
  final String emailId;
  final String userProfile;
  final String shopAddress;
  final String qrImage;
  final String lat;
  final String long;

  FirebaseUserModel({ required this.uId,required this.name,required this.emailId,required this.userProfile,required this.shopAddress,required this.qrImage,required this.lat,required this.long});

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) =>
      _$FirebaseUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$FirebaseUserModelToJson(this);
}