import 'package:flutter/material.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name) {
      // case RoutesName.walk_Through_Screen:
      //   return MaterialPageRoute(builder : (BuildContext context) =>WalkThroughScreen());
      //
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  'No route Defined'
                ),
              ),
            ),
          );
        });
    }
  }
}