import 'dart:io';

abstract class PlantComponent {

  String nickname;
  final String name;
  final String description;
  final String image;

  PlantComponent(this.name, this.description, this.image, this.nickname);


}