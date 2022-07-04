// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      postId: json['postId'] as int,
      commentId: json['commentId'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'commentId': instance.commentId,
      'name': instance.name,
      'email': instance.email,
      'body': instance.body,
    };
