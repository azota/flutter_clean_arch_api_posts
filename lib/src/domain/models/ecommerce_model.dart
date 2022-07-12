import 'package:json_annotation/json_annotation.dart';

part 'ecommerce_model.g.dart';

@JsonSerializable()
class EcommerceModel {
  final int postId;
  final int userId;
  final String title;

  EcommerceModel({
    required this.postId,
    required this.userId,
    required this.title,
  });

  factory EcommerceModel.fromJson(Map<String, dynamic> json) =>
      _$EcommerceModelFromJson(json);
}
