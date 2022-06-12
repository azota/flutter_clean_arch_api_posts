import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel {
  final int postId;
  final int commentId;
  final String name;
  final String email;
  final String body;

  CommentModel(this.postId, this.commentId, this.name, this.email, this.body);

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
