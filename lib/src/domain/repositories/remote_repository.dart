import '../models/comment_model.dart';
import '../models/data_state_model.dart';
import '../models/ecommerce_model.dart';
import '../models/post_model.dart';

abstract class RemoteRepository {
  Future<DataState<List<PostModel>>> getPosts();

  Future<DataState<List<CommentModel>>> getCommentsByPostId(int postId);

  Future<DataState<List<EcommerceModel>>> getEcommerce();
}
