import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

class PlantApi extends Plant {
  PlantApi(
      {required super.name,
      required super.description,
      required super.imageUrl,
      required super.nickname});

  factory PlantApi.fromJson(Map<String, dynamic> json) {
    return PlantApi(
        name: json['name'],
        description: json['description'],
        imageUrl: json['image_url'],
        nickname: json['nickname'] ?? ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'nickname': nickname
    };
  }
}
