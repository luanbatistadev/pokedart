import 'package:flutter/material.dart';
import 'package:pokedart/screens/home_page/components/logo.dart';
import 'package:pokedart/screens/home_page/components/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const _kBackgroundColor = Color.fromARGB(255, 253, 26, 87);
    return Scaffold(
      backgroundColor: _kBackgroundColor,
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
