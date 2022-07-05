import 'dart:developer';

import '../../domain/models/comment_model.dart';
import '../../domain/models/data_state_model.dart';
import '../../domain/models/post_model.dart';
import '../../domain/repositories/remote_repository.dart';
import '../data_sources/mock_data/post_mock.dart';
import '../data_sources/remote_data/post_api_provider.dart';
import '../translator/post_translator.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final PostApiProvider _postApiProvider;

  const RemoteRepositoryImpl(this._postApiProvider);

  @override
  Future<DataState<List<PostModel>>> getPosts() async {
    try {
      //final response = await _postApiProvider.getPosts();
      final response = await PostMock().getPostsMock();

      return PostTranslator().translatePost(response);
    } catch (e) {
      log(e.toString());

      return DataState.error(Exception(), e.toString());
    }
  }

  @override
  Future<DataState<List<CommentModel>>> getCommentsByPostId(int postId) async {
    try {
      final response = await _postApiProvider.getCommentsByPostId(postId);

      return PostTranslator().translateComment(response);
    } catch (e) {
      log(e.toString());

      return DataState.error(Exception(), e.toString());
    }
  }
}
