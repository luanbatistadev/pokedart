import 'package:flutter/material.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/screens/favorite_page/favorite_screen.dart';
import 'package:pokedart/screens/home_page/home_screen.dart';
import 'package:pokedart/screens/pokemon_page/pokemon_screen.dart';
import 'package:pokedart/screens/result_page/result_screen.dart';
import 'package:pokedart/screens/search_page.dart/search_page.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Getting arguments passed in while calling Navigator.pushNamed
  final args = settings.arguments;

  switch (settings.name) {
    case '/home':
      return _createRoute(const HomePage());
    case '/result':
      // Validation of correct data type
      if (args is String) {
        return _createRoute(
          ResultPage(
            pokemonName: args,
          ),
        );
      }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      return _errorRoute();
    case '/search':
      return _createRoute(const SearchPage());
    case '/favorite':
      return _createRoute(const FavoriteScreen());
    case '/pokemon':
      if (args is Pokemon) {
        return _createRoute(PokemonPage(pokemon: args));
      }
      return _errorRoute();
    default:
      // If there is no such named route in the switch statement, e.g. /third
      return _errorRoute();
  }
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    },
  );
}
