import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedart/components/constants/constants.dart';
import 'package:pokedart/components/routes/routes.dart';
import 'package:pokedart/screens/home_page/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: kRedColor),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Pokemon App',
      onGenerateRoute: generateRoute,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
