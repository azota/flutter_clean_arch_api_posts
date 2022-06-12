import 'package:dio/dio.dart';
import 'package:flutter_app/src/data/models/comment_response_model.dart';
import 'package:flutter_app/src/data/models/post_model.dart';
import 'package:retrofit/retrofit.dart';

part 'post_api_provider.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class PostApiProvider {
  factory PostApiProvider(Dio dio) = _PostApiProvider;

  @GET("/posts")
  Future<List<PostModel>> getPosts();

  @GET("/comments?postId={postId}")
  Future<CommentResponseModel> getCommentsByPostId(@Path("postId") int postId);
}
