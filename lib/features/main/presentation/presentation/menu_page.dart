import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/widgets/bottom_navigation_bar.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';



class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    var index = 1;
    return Column(
                  children: [
                    Text('menu', )
                  ],
              );

  }
}
