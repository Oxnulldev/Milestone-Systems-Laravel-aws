import 'package:flutter/material.dart';

//Routes of the project
import 'package:codex/src/presentation/screens/home_screen.dart';


class Routes{

  static const home = '/';



  static Route routes(RouteSettings routeSettings){
    switch(routeSettings.name){
      case home:
        // return MaterialPageRoute(builder: (context) => const LandingPage());
        // return _buildRoute(LandingPage.create);
      default:
        throw Exception('Ruta no encontrada');
    }
  }

  static MaterialPageRoute _buildRoute(Function build)=>
      MaterialPageRoute(builder: (context)=>build(context));
}