import 'package:flutter/material.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/components/models/task_model.dart';
import 'package:online_garden/features/auth_verefication/auth_verefication_page.dart';
import 'package:online_garden/features/authorization/forgot_password/presentation/presentation/forgot_password_page.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/presentation/login_page.dart';
import 'package:online_garden/features/authorization/sign_up/presentation/presentation/registration_page.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/presentation.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/presentation.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/presentation.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/presentation.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(path: '/',
      builder: (context, state) => const AuthorizationVerification(),
      routes: [
        GoRoute(path: 'main',
            builder: (context, state) {
              return const MainPage();
            },
          routes: [
            GoRoute(path: 'select_plant',
                builder: (context, state) => const PlantsBlocPage(),
              routes: [
                GoRoute(path: 'customization_plant',
                builder: (context, state) {
                  Plant plant = state.extra as Plant;
                  return CustomizationPlantBlocProvider(plant: plant);
                }
                )
              ]
            ),
            GoRoute(path: 'create_task',
                builder: (context, state) => const TaskBlocProvider()
            ),
          ]
        ),
        GoRoute(path: 'login',
            builder: (context, state) => const LoginPage()
        ),
        GoRoute(path: 'registration',
            builder: (context, state) => const RegistrationPage()
        ),
        GoRoute(path: 'forgot_password',
            builder: (context, state) => const ForgotPasswordPage()
        ),

      ]
      )
      

    ],
    initialLocation: '/',
    debugLogDiagnostics: true

  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = AppRouter().router;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Online Garden',
      theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          scaffoldBackgroundColor: const Color(0xfff0f2f1)
      ),
      /*localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ru', ''), // Russian, no country code
      ],*/
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
