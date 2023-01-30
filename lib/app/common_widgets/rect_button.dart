import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRectButton extends StatelessWidget {
  final String buttonLabel;
  final Function onButtonClicked;
  Color? backgroundColor;

   CustomRectButton({
    Key? key,
    required this.buttonLabel,
    required this.onButtonClicked,
    this.backgroundColor,
 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Text(buttonLabel),
    );
  }
}
