import 'package:flutter/foundation.dart';
import '../dto/comment_dto.dart';
import '../dto/post_dto.dart';
import '../../domain/models/comment_model.dart';
import '../../domain/models/post_model.dart';

import '../../domain/models/data_state_model.dart';

class PostTranslator {
  static final PostTranslator _singleton = PostTranslator._internal();

  PostTranslator._internal();

  factory PostTranslator() => _singleton;

  Future<DataState<List<PostModel>>> translatePost(
    List<PostDto> postsInfo,
  ) {
    try {
      return compute(
        (List<PostDto> postsInfo) {
          var translated = postsInfo
              .map(
                (post) => PostModel(
                  postId: post.postId,
                  userId: post.userId,
                  title: post.title,
                ),
              )
              .toList();

          return DataState.success(
            translated,
          );
        },
        postsInfo,
      );
    } catch (error) {
      //throw TranslateException(error.toString());
      throw Exception('');
    }
  }

  Future<DataState<List<CommentModel>>> translateComment(
    List<CommentDto> commentInfo,
  ) {
    try {
      return compute(
        (List<CommentDto> commentInfo) {
          var translated = commentInfo
              .map(
                (comment) => CommentModel(
                  postId: comment.postId,
                  commentId: comment.commentId,
                  name: comment.name,
                  email: comment.email,
                  body: comment.body,
                ),
              )
              .toList();

          return DataState.success(
            translated,
          );
        },
        commentInfo,
      );
    } catch (error) {
      //throw TranslateException(error.toString());
      throw Exception('');
    }
  }
}
