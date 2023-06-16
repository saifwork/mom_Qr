// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FirebaseUserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirebaseUserModel _$FirebaseUserModelFromJson(Map<String, dynamic> json) =>
    FirebaseUserModel(
      uId: json['uId'] as String,
      name: json['name'] as String,
      emailId: json['emailId'] as String,
      userProfile: json['userProfile'] as String,
      shopAddress: json['shopAddress'] as String,
      qrImage: json['qrImage'] as String,
      lat: json['lat'] as String,
      long: json['long'] as String,
    );

Map<String, dynamic> _$FirebaseUserModelToJson(FirebaseUserModel instance) =>
    <String, dynamic>{
      'uId': instance.uId,
      'name': instance.name,
      'emailId': instance.emailId,
      'userProfile': instance.userProfile,
      'shopAddress': instance.shopAddress,
      'qrImage': instance.qrImage,
      'lat': instance.lat,
      'long': instance.long,
    };
