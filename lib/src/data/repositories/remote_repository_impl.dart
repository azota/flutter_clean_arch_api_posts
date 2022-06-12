import 'package:flutter_app/src/data/data_sources/remote_data/post_api_provider.dart';
import 'package:flutter_app/src/data/models/comment_response_model.dart';
import 'package:flutter_app/src/domain/entitis/post_entity.dart';
import 'package:flutter_app/src/domain/repositories/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final PostApiProvider _postApiProvider;

  const RemoteRepositoryImpl(this._postApiProvider);

  @override
  Future<List<PostEntity>> getPosts() async {
    var response;
    try {
      response = await _postApiProvider.getPosts();
    } catch (e) {
      print(e);
    }

    return response;
  }

  @override
  Future<CommentResponseModel> getCommentsByPostId(int postId) {
    return _postApiProvider.getCommentsByPostId(postId);
  }
}
