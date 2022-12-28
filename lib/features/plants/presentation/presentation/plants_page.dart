import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_garden/features/plants/data/repository/plants_repository.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/domain/usecases/get_plants.dart';

class PlantsPage extends StatelessWidget {
  const PlantsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetPlants getPlants = GetPlants();
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          centerTitle: true,
          title: TextFormField(
            onChanged: (text) {},
            onFieldSubmitted: (text) {},
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: const UnderlineInputBorder(),
              hintText: 'Search for something',
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
            ),
          ),
          floating: true,
          elevation: 0,
          actions: [],
        ),
        FutureBuilder(
            future: getPlants.getPlants(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var doc = snapshot.data!.docs;
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    final model = Plant(
                        name: doc[index].data()['name'],
                        description: doc[index].data()['description'] ?? '',
                        imageUrl: doc[index].data()['image_url']);
                    return SizedBox(
                      height: 150,
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(4)),
                            child: SizedBox(
                                width: 150,
                                child: Image.network(
                                  model.imageUrl,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Text(
                            model.name,
                          )
                        ],
                      )),
                    );
                  },
                  childCount: snapshot.data!.docs.length,
                ));
              } else {
                return SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 60,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                );
              }
            })
      ],
    );
  }
}
