import 'package:json_annotation/json_annotation.dart';

part 'post_dto.g.dart';

@JsonSerializable()
class PostDto {
  @JsonKey(name: 'id')
  final int postId;
  final int userId;
  final String title;

  PostDto(this.postId, this.userId, this.title);

  factory PostDto.fromJson(Map<String, dynamic> json) =>
      _$PostDtoFromJson(json);
}
