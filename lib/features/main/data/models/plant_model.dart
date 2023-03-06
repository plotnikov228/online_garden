import 'dart:io';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';

class PlantModelImpl extends PlantModel {
  final String nickname;
  final String name;
  final String description;
  final String image;
  PlantModelImpl({required this.name, required this.description, required this.image, required this.nickname}) : super(name, description, image, nickname);

  factory PlantModelImpl.fromJson(Map<String, dynamic> json) {
    return PlantModelImpl(
        name: json['name'],
        description: json['description'],
        image: json['image'],
        nickname: json['nickname']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'name' : name,
      'description': description,
      'image': image,
      'nickname': nickname
    };
  }

}