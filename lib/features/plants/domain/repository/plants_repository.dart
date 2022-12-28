import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';

abstract class PlantsRepository {
  Future getPlants ();
 }