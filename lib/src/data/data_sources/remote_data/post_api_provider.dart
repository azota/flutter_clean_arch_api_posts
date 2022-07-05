import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../dto/comment_dto.dart';
import '../../dto/post_dto.dart';

part 'post_api_provider.g.dart';

@RestApi(
    /* baseUrl:
      'https://jsonplaceholder.typicode.com', */ /* parser: Parser.FlutterCompute */
    )
abstract class PostApiProvider {
  factory PostApiProvider(Dio dio, {String baseUrl}) = _PostApiProvider;

  @GET('posts')
  Future<List<PostDto>> getPosts();

  @GET('comments')
  Future<List<CommentDto>> getCommentsByPostId(@Query('postId') int postId);

  /* @GET('comments?postId={postId}')
  Future<List<CommentDto>> getCommentsByPostId(@Path('postId') int postId); */

}
