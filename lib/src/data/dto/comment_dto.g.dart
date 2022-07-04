// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
      json['postId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'id': instance.commentId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
