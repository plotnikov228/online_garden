
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/bottom_navigation_bar.dart';
import 'package:online_garden/components/enter_exit_route.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/state.dart';
import 'package:online_garden/features/main/presentation/presentation/home_page.dart';
import 'package:online_garden/features/main/presentation/presentation/menu_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;
    return BlocProvider(
        create: (BuildContext context) => MainBloc(InitialState())..add(SetupHomePage()),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Menu')
                ],
                selectedItemColor: Colors.lightGreen,
                currentIndex: selectedIndex,
                onTap: (index) {
                  selectedIndex = index;
                  context.read<MainBloc>().add(GoToAnotherPageEvent(selectedIndex));
                },
              ),
              body: state is MenuState
                  ? const MenuPage()
                  : state is HomeState
                  ? HomePage(tasks: state.tasks, plants: state.plants,)
                  : const HomePage(tasks: [], plants: [],),
            );
          },
        ));
  }
}
