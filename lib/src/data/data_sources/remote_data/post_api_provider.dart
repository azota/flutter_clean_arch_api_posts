import 'package:dio/dio.dart';
import '../../dto/comment_dto.dart';
import '../../dto/post_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api_provider.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostApiProvider {
  factory PostApiProvider(Dio dio) = _PostApiProvider;

  @GET('/posts')
  Future<List<PostDto>> getPosts();

  @GET('/comments?postId={postId}')
  Future<List<CommentDto>> getCommentsByPostId(@Path('postId') int postId);
}
