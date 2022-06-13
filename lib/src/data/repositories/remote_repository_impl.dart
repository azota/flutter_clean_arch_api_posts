import 'package:flutter_app/src/data/data_sources/remote_data/post_api_provider.dart';
import 'package:flutter_app/src/data/translator/post_translator.dart';
import 'package:flutter_app/src/domain/models/comment_model.dart';
import 'package:flutter_app/src/domain/models/data_state_model.dart';
import 'package:flutter_app/src/domain/models/post_model.dart';
import 'package:flutter_app/src/domain/repositories/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final PostApiProvider _postApiProvider;

  const RemoteRepositoryImpl(this._postApiProvider);

  @override
  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      final response = await _postApiProvider.getPosts();
      return PostTranslator().translatePost(response);
    } catch (e) {
      print(e);
      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<List<CommentModel>>> getCommentsByPostId(int postId) async {
    try {
      final response = await _postApiProvider.getCommentsByPostId(postId);
      return PostTranslator().translateComment(response);
    } catch (e) {
      print(e);
      return DataState.error(Exception(), e.toString());
    }
  }
}
