// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ecommerce_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EcommerceDto _$EcommerceDtoFromJson(Map<String, dynamic> json) => EcommerceDto(
      json['id'] as int,
      json['userId'] as int,
      json['title'] as String,
    );

Map<String, dynamic> _$EcommerceDtoToJson(EcommerceDto instance) =>
    <String, dynamic>{
      'id': instance.postId,
      'userId': instance.userId,
      'title': instance.title,
    };
