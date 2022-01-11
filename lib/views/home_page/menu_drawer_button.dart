import 'package:flutter/material.dart';

class MenuDrawerButton extends StatelessWidget {
  final double width;
  final double iconSize;
  final VoidCallback onPressed;

  const MenuDrawerButton({
    Key? key,
    required this.width,
    required this.onPressed,
    this.iconSize = 45.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // padding left de 20 por que o ícone tem 5 borda.
      padding: const EdgeInsets.fromLTRB(20.0, 25.0, 25.0, 0.0),
      child: SizedBox(
        width: width,
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.menu,
              size: iconSize,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
