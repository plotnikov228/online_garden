import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/widgets/bottom_navigation_bar.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/state.dart';
import 'package:online_garden/features/main/presentation/presentation/home_loading_page.dart';
import 'package:online_garden/features/main/presentation/presentation/home_page.dart';
import 'package:online_garden/features/main/presentation/presentation/menu_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedIndex = 0;
    return BlocProvider(
        create: (BuildContext context) =>
            MainBloc(HomeLoadingState())..add(SetupHomePage()),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            return Scaffold(
                bottomNavigationBar:
                    BottomNavigationBarWidget(selectedIndex, () {
                  context
                      .read<MainBloc>()
                      .add(GoToAnotherPageEvent(selectedIndex));
                }),
                body: state is MenuState
                    ? const MenuPage()
                    : state is HomeState
                        ? HomePage(
                            tasks: state.tasks,
                            plants: state.plants,
                            isLoading: state.isLoading,
                          )
                        : const HomeLoadingPage());
          },
        ));
  }
}
