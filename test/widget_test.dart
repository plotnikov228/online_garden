// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:online_garden/components/enter_exit_route.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/presentation.dart';
import 'package:online_garden/features/main/presentation/presentation/home_page.dart';
import 'package:online_garden/features/main/presentation/presentation/menu_page.dart';

import 'package:online_garden/main.dart';

void main() {
  testWidgets('SlideTransitionRight Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    /*SlideTransitionRight(enterPage: HomePage(), exitPage: MenuPage(), right: true);*/
    await tester.pumpWidget(Scaffold(body: HomePage(tasks: [],));

    // Verify that our counter starts at 0.
    expect(find.text('main'), findsOneWidget);

    expect(find.text('menu'), findsNothing);

  });
}
