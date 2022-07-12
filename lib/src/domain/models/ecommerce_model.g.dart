// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcommerceModel _$EcommerceModelFromJson(Map<String, dynamic> json) =>
    EcommerceModel(
      postId: json['postId'] as int,
      userId: json['userId'] as int,
      title: json['title'] as String,
    );

Map<String, dynamic> _$EcommerceModelToJson(EcommerceModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'userId': instance.userId,
      'title': instance.title,
    };
