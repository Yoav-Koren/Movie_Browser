import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final double size;

  const FavoriteButton({
    Key? key,
    required this.isFavorite,
    this.size = 48,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.blueGrey ?? Colors.transparent,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(size / 2))),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          //TODO add here
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, animation) =>
                ScaleTransition(scale: animation, child: child),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              key: ValueKey(isFavorite),
              size: size,
              color: isFavorite
                  ? (Colors.red ?? Colors.redAccent)
                  : (Colors.white ?? theme.iconTheme.color),
            ),
          ),
        ),
      ),
    );
  }
}
