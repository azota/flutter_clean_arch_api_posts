import 'package:flutter_app/src/data/models/comment_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_response_model.g.dart';

@JsonSerializable()
class CommentResponseModel {
  final List<CommentModel> comments;
  final String error;

  CommentResponseModel(this.comments, this.error);

  /* CommentResponseModel.withError(String errorValue)
      : comments = [],
        error = errorValue; */

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseModelFromJson(json);
}
