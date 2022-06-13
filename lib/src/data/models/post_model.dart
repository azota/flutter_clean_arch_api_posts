import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: 'id')
  final int postId;
  final int userId;
  final String title;

  PostModel(this.postId, this.userId, this.title);

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  /* final List<PostModel> posts;
  final String error;

  PostResponseModel(this.posts, this.error);

  PostResponseModel.withError(String errorValue)
      : posts = [],
        error = errorValue;

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json); */
}
