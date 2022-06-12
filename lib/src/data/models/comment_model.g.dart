// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      json['postId'] as int,
      json['commentId'] as int,
      json['name'] as String,
      json['email'] as String,
      json['body'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentId': instance.commentId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
