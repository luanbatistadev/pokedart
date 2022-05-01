import 'package:flutter/material.dart';
import 'package:pokedart/components/constants/constants.dart';

class LogoMain extends StatelessWidget {
  const LogoMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kHeightScreen = MediaQuery.of(context).size.height;
    final _kHeightWidget = _kHeightScreen * 0.25;
    const _kImageScale = 0.8;
    return SizedBox(
      height: _kHeightWidget,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset('assets/images/logo.png', scale: _kImageScale),
          Padding(
            padding: kDotsPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/dots.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
