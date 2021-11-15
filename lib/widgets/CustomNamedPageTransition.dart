import 'package:flutter/material.dart';
class MyCustomRoute extends PageRouteBuilder {
  final Widget widget;
  MyCustomRoute({required this.widget})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return widget;
      },
      transitionDuration: Duration(milliseconds: 150),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return new ScaleTransition(
          scale: new Tween<double>(
            begin:0.7,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.00,
                0.50,
                curve: Curves.bounceInOut,
              ),
            ),
          ),
          child: ScaleTransition(
            scale: Tween<double>(
              begin: 0.5,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.0,
                  1.00,
                  curve: Curves.easeOut,
                ),
              ),
            ),
            child: child,
          ),
        );
      }
  );
}
