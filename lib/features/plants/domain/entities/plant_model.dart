import 'package:online_garden/components/models/plant_model.dart';

class Plant extends PlantComponent {
  @override
  final String name;
  @override
  String nickname;
  @override
  final String description;
  final String imageUrl;

  Plant(
      {required this.name,
      required this.description,
      required this.imageUrl, required this.nickname})
      : super(name, description, imageUrl, nickname);
}
