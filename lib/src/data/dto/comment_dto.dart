import 'package:json_annotation/json_annotation.dart';

part 'comment_dto.g.dart';

@JsonSerializable()
class CommentDto {
  final int postId;
  @JsonKey(name: 'id')
  final int commentId;
  final String name;
  final String email;
  final String body;

  CommentDto(this.postId, this.commentId, this.name, this.email, this.body);

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}
