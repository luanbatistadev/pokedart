import 'package:flutter/material.dart';
import 'package:pokedart/components/constants/constants.dart';
import 'package:pokedart/screens/home_page/components/logo.dart';
import 'package:pokedart/screens/home_page/components/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kRedColor,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            LogoMain(),
            Search(),
          ],
        ),
      ),
    );
  }
}
