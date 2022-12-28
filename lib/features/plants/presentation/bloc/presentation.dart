import 'package:flutter/material.dart';
import 'package:online_garden/features/plants/presentation/presentation/plants_page.dart';

class PlantsBlocPage extends StatelessWidget {
  const PlantsBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PlantsPage(),
    );
  }
}
