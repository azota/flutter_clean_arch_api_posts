import 'package:flutter_app/src/domain/models/comment_model.dart';
import 'package:flutter_app/src/domain/models/data_state_model.dart';
import 'package:flutter_app/src/domain/models/post_model.dart';

abstract class RemoteRepository {
  Future<DataState<List<PostModel>>> getPosts();

  Future<DataState<List<CommentModel>>> getCommentsByPostId(int postId);
}
