import 'package:json_annotation/json_annotation.dart';

part 'post_entity.g.dart';

@JsonSerializable()
class PostEntity {
  final int postId;
  final int userId;
  final String title;

  PostEntity(this.postId, this.userId, this.title);

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
