import 'package:flutter/material.dart';
import 'package:pokedart/components/constants/constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();

  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          isFocused = true;
        });
      } else {
        setState(() {
          isFocused = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSearchPadding,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20).copyWith(top: 50, bottom: 30),
          child: Column(
            children: [
              _buildTitle(),
              _buildSubTitle(),
              _buildSearchTextField(context),
              _buildSearchButton(context),
              _buildFavoriteButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context, {
    required String text,
    required VoidCallback onPressed,
    required Color fontColor,
    required Color backgroundColor,
  }) {
    const _kButtonHeight = 45.0;
    const _kBorderRadius = 20.0;
    const _kFontSize = 16.0;
    return Padding(
      padding: kSearchPadding.copyWith(left: 0, right: 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(_kBorderRadius),
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: _kButtonHeight,
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: fontColor,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                      fontSize: _kFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    const _kBackgroudColor = Color.fromARGB(255, 255, 205, 5);
    return _buildButton(
      context,
      text: 'VER FAVORITOS',
      onPressed: () {
        Navigator.pushNamed(context, '/favorite');
      },
      fontColor: kFontColor,
      backgroundColor: _kBackgroudColor,
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    const _kFontColor = Colors.white;
    return _buildButton(
      context,
      text: 'PESQUISAR',
      onPressed: () {
        Navigator.pushNamed(context, '/search');
      },
      fontColor: _kFontColor,
      backgroundColor: kBlueColor,
    );
  }

  Widget _buildSearchTextField(BuildContext context) {
    const _kTextFieldPadding = EdgeInsets.only(bottom: 50, top: 15);
    const _kTextFieldHeight = 50.0;
    const _kHintTextFontSize = 16.0;
    const _kHintTextFontColor = Colors.grey;
    const _kBorderRadius = 30.0;
    const _kBorderColor = Colors.grey;
    return Padding(
      padding: _kTextFieldPadding,
      child: SizedBox(
        height: _kTextFieldHeight,
        child: Material(
          elevation: 5,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(_kBorderRadius),
          child: TextField(
            cursorColor: kBlueColor,
            style: const TextStyle(
              fontSize: _kHintTextFontSize,
              color: kBlueColor,
              fontWeight: FontWeight.w500,
            ),
            controller: _searchController,
            focusNode: _focusNode,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  if (_searchController.text != '') {
                    Navigator.pushNamed(
                      context,
                      '/result',
                      arguments: _searchController.text,
                    );
                  }
                },
                icon: Image.asset(
                  'assets/icons/search.png',
                  color: !isFocused ? _kBorderColor : null,
                ),
              ),
              hintText: 'Digite o nome do pokémon...',
              hintStyle: const TextStyle(
                fontSize: _kHintTextFontSize,
                fontWeight: FontWeight.w300,
                color: _kHintTextFontColor,
                fontFamily: 'OpenSans',
              ),
              focusColor: kRedColor,
              fillColor: kRedColor,
              hoverColor: kRedColor,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kBlueColor),
                borderRadius: BorderRadius.circular(_kBorderRadius),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_kBorderRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubTitle() {
    const _kFontSize = 16.0;
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0).copyWith(left: 0, right: 0),
            child: const Text(
              '''Utilize a pokedart para encontrar mais informações sobre os seus pokémons.''',
              style: TextStyle(
                fontSize: _kFontSize,
                fontWeight: FontWeight.w300,
                color: kFontColor,
                fontFamily: 'OpenSans',
              ),
              maxLines: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    const _kFontSize = 22.0;
    return Row(
      children: const [
        Text(
          'Conheça à PokeDart',
          style: TextStyle(
            fontSize: _kFontSize,
            fontWeight: FontWeight.bold,
            color: kFontColor,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    );
  }
}
