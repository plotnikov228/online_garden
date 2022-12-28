import 'package:online_garden/features/main/domain/entities/plant_model.dart';

class PlantModelImpl extends PlantModel {
  PlantModelImpl({required super.name, required super.description, required super.image});

  factory PlantModelImpl.fromJson(Map<String, dynamic> json) {
    return PlantModelImpl(
        name: json['name'],
        description: json['description'],
        image: json['image']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'description': description,
      'image': image
    };
  }

}