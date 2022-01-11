import 'package:flutter/material.dart';

class MenuBackButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;

  const MenuBackButton({Key? key, required this.width, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 25.0, 20.0, 0.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: Icon(
              Icons.keyboard_backspace,
              size: 45.0,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ),
    );
  }
}
