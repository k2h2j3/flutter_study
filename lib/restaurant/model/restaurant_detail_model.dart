import 'package:actual/common/const/data.dart';
import 'package:actual/common/utils/data_utils.dart';
import 'package:actual/restaurant/model/restaurant_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_detail_model.g.dart';

@JsonSerializable()
class RestaurantDetailModel extends RestaurantModel {
  final String detail;
  final List<RestaurantProdcutModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

  // 1. Map<String, dynamic> 형식의 json 데이터를 매개변수
  // 2. _$RestaurantDetailModelFromJson 함수를 호출하여 RestaurantDetailModel 객체를 반환
  factory RestaurantDetailModel.fromJson(Map<String, dynamic>json)
  => _$RestaurantDetailModelFromJson(json);
}

@JsonSerializable()
class RestaurantProdcutModel {
  final String id;
  final String name;
  @JsonKey(
    fromJson: DataUtils.pathToUrl,
  )
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProdcutModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });

  factory RestaurantProdcutModel.fromJson(Map<String, dynamic> json)
  => _$RestaurantProdcutModelFromJson(json);
}
