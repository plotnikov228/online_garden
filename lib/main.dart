import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/presentation/login_page.dart';
import 'package:online_garden/features/main/data/data_sources/local/tasks_datasource.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/presentation.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalDataSources.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Garden',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        backgroundColor: const Color(0xfff0f2f1)
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
      home: const AuthorizationVerification()
    );
  }
}

class AuthorizationVerification extends StatelessWidget {
  const AuthorizationVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
    builder: (context, snapshot){
          if(snapshot.hasData) {
            return const MainPage();
          }
          else {
            return const LoginPage();
          }
    }));
  }
}
