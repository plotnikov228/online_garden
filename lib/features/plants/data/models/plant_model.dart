import 'package:online_garden/features/main/domain/entities/plant_model.dart';

class PlantApi extends PlantModel {
  PlantApi({required super.name, required super.description, required super.image});

  factory PlantApi.fromJson(Map<String, dynamic> json) {
    return PlantApi(name: json['name'], description: json['description'], image: json['image_url']);
  }

  Map<String, dynamic> toJson () {
    return {
      'name': name,
      'description': description,
      'image_url': image
    };
  }
}