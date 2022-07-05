import 'dart:convert';

import 'package:flutter/services.dart';

import '../../dto/post_dto.dart';

class PostMock {
  Future<List<PostDto>> getPostsMock() async {
    try {
      var json = await rootBundle.loadString('test/mock/posts.json');
      List<dynamic> decoded = jsonDecode(json);
      List<PostDto> postDto = decoded.map((e) => PostDto.fromJson(e)).toList();

      return Future(() => postDto);
    } catch (error) {
      throw Exception();
    }
  }
}
