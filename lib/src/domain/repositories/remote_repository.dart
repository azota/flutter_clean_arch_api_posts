import 'package:flutter_app/src/data/models/comment_response_model.dart';
import 'package:flutter_app/src/domain/entitis/post_entity.dart';

abstract class RemoteRepository {
  Future<List<PostEntity>> getPosts();

  Future<CommentResponseModel> getCommentsByPostId(int postId);
}
