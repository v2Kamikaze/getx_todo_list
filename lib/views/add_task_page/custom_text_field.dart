import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.inputController,
    required this.label,
  }) : super(key: key);

  final TextEditingController inputController;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: inputController,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: Theme.of(context).textTheme.headline2),
      ),
    );
  }
}
