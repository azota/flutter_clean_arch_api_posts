import 'package:flutter_app/src/data/models/post_model%20copy.dart';
import 'package:flutter_app/src/domain/entitis/post_entity.dart';

import '../../domain/models/data_state_model.dart';

class PostTranslator {
  static final PostTranslator _singleton = PostTranslator._internal();

  PostTranslator._internal();

  factory PostTranslator() => _singleton;

  Future<DataState<List<PostEntity>>> translatePost(
    List<PostModel> popupInfo,
  ) {
    try {
      return compute(
        (List<PostModel> popupInfo) {
          var translated = popupInfo
              .map(
                (popup) => Popup(
                  imgUrl: popup.imgUrl,
                  bannerType: popup.bannerType,
                  linkUrl: popup.linkUrl,
                ),
              )
              .toList();

          return DataState.success(
            translated,
          );
        },
        popupInfo,
      );
    } catch (error) {
      throw TranslateException(error.toString());
    }
  }
}
