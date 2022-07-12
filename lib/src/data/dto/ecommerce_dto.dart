import 'package:json_annotation/json_annotation.dart';

part 'ecommerce_dto.g.dart';

@JsonSerializable()
class EcommerceDto {
  @JsonKey(name: 'id')
  final int postId;
  final int userId;
  final String title;

  EcommerceDto(this.postId, this.userId, this.title);

  factory EcommerceDto.fromJson(Map<String, dynamic> json) =>
      _$EcommerceDtoFromJson(json);
}
