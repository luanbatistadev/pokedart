import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedart/components/constants/constants.dart';
import 'package:pokedart/components/extension_string.dart';
import 'package:pokedart/components/place_holder.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/stores/pokemon_stores.dart';

mixin AnimatedHeaderMixin on SliverPersistentHeaderDelegate {
  double animation(double shrinkOffset) {
    final diff = maxExtent - shrinkOffset;

    final progress = diff / maxExtent;

    return progress;
  }

  double reverseAnimation(double shrinkOffset) {
    return 1 - animation(shrinkOffset);
  }
}

class PokemonHeader extends SliverPersistentHeaderDelegate
    with AnimatedHeaderMixin {
  PokemonHeader(
    this.pokemon, {
    required this.maxExtent,
  });
  final Pokemon pokemon;

  @override
  double get minExtent => kToolbarHeight * 1.8;
  @override
  final double maxExtent;

  static const _normal = 2.0;

  double _elementOpacity(double animation, {double factor = _normal}) {
    return math.pow(animation, factor) as double;
  }

  double _reverseElementOpacity(double animation, {double factor = _normal}) {
    return 1 - _elementOpacity(animation, factor: factor);
  }

  PokemonApiStore pokemonApiStore = PokemonApiStore();

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    pokemonApiStore.getFavorite(pokemon.name!);
    final animation = this.animation(shrinkOffset);
    final reverseAnimation = this.reverseAnimation(shrinkOffset);

    return InkWell(
      child: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          children: [
            _buildShrinkPokemonHeader(
              context,
              animation,
              reverseAnimation,
            ),
            _buildExpandedPokemonHeader(
              context,
              animation,
              reverseAnimation,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedPokemonHeader(
    BuildContext context,
    double animation,
    double reverseAnimation,
  ) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: _elementOpacity(
          animation,
        ),
        child: Container(
          color: kRedColor,
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(height: maxExtent),
            child: Padding(
              padding: const EdgeInsets.all(20).copyWith(left: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCloseButton(context),
                  _buildCicleAvatarTitle(),
                  _buildFavoriteButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildShrinkPokemonHeader(
    BuildContext context,
    double animation,
    double reverseAnimation,
  ) {
    return Positioned(
      bottom: 0,
      top: 0,
      left: 0,
      right: 0,
      child: Opacity(
        opacity: _reverseElementOpacity(
          animation,
        ),
        child: Container(
          color: kRedColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCicleAvatarTitle(),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: _buildFavoriteButton(
                  context,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Widget _buildCloseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, bottom: 30),
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const SizedBox(
              height: 25,
              width: 25,
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 33,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCicleAvatarTitle() {
    final String? image = pokemon.sprites?.frontDefault;
    final String? name = pokemon.name?.capitalize();
    final String? type = pokemon.types?.first.type?.name?.capitalize();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: CircleAvatar(
            radius: kRadius + 2,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: kRedColor,
              radius: kRadius,
              child: image == null ? null : Image.network(image),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: kFontSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildText(
                name!,
                pokemon.isBaby!=null && pokemon.isBaby!
                    ? 'Baby'
                    : pokemon.isLegendary!=null && pokemon.isLegendary!
                        ? 'Legendary'
                        : pokemon.isLegendary!=null && pokemon.isMythical!
                            ? 'Mythical'
                            : 'Normal',
                true,
              ),
              _buildText('Tipo', type, false),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFavoriteButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Observer(
          builder: (context) => GestureDetector(
            onTap: () async {
              pokemonApiStore.changeFavorite(pokemon);
            },
            child: Icon(
              pokemonApiStore.isFavorite ? Icons.star : Icons.star_border,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildText(String staticText, String? text, bool isTitle) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 150),
          child: Text(
            staticText,
            style: TextStyle(
              color: Colors.white,
              fontSize: isTitle ? kFontSize : 14.0,
              fontWeight: isTitle ? FontWeight.bold : FontWeight.w300,
              fontFamily: 'OpenSans',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        PlaceholderContainer(
          size: PlaceholderContainer.textPlaceholder,
          child: text == null
              ? null
              : Text(
                  ' - $text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: isTitle ? kFontSize : 14.0,
                    fontWeight: isTitle ? FontWeight.bold : FontWeight.w300,
                    fontFamily: 'OpenSans',
                  ),
                ),
        ),
      ],
    );
  }
}
