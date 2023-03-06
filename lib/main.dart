import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_garden/components/services/hive_db.dart';
import 'package:online_garden/components/services/router.dart';
import 'package:online_garden/features/authorization/sign_in/presentation/presentation/login_page.dart';
import 'package:online_garden/features/main/data/data_sources/local/tasks_datasource.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/presentation.dart';

import 'features/auth_verefication/auth_verefication_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveDB.initDB();
  runApp(const MyApp());
}



