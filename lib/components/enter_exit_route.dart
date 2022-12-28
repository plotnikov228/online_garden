import 'package:flutter/material.dart';
/*

class EnterExitRouteRight extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRouteRight({required this.exitPage, required this.enterPage})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) =>
    enterPage,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(-1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}

class EnterExitRouteLeft extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  EnterExitRouteLeft({required this.exitPage, required this.enterPage})
      : super(
    pageBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,) =>
    enterPage,
    transitionsBuilder: (BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,) =>
        Stack(
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.0),
                end: const Offset(1.0, 0.0),
              ).animate(animation),
              child: exitPage,
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: enterPage,
            )
          ],
        ),
  );
}
*/


Widget SlideTransitionRight(Widget enterPage, Widget exitPage, bool right,
    Animation<Offset> firstAnimation, Animation<Offset> secondAnimation ) {

  /*Animation<Offset> firstAnimation = Tween<Offset>(
    begin: const Offset(0.0, 0.0),
    end: Offset(right ? -1.0 : 1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInCubic,
  ));

  Animation<Offset> secondAnimation = Tween<Offset>(
    begin: Offset(right ? 1.0 : -1.0, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeInCubic,
  ));*/

  return Stack(
    children: <Widget>[
      SlideTransition(
        position: firstAnimation,
        child: exitPage,
        transformHitTests: true,
        textDirection: TextDirection.ltr,
      ),
      SlideTransition(
        position: secondAnimation,
        child: enterPage,
        transformHitTests: true,
        textDirection: TextDirection.ltr,
      )
    ],
  );
}

