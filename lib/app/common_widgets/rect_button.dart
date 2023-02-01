import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomRectButton extends StatelessWidget {
  final String buttonLabel;
  final Function onButtonClicked;
  double borderRadius;
  Color? backgroundColor;

  CustomRectButton({
    Key? key,
    required this.buttonLabel,
    required this.onButtonClicked,
    this.backgroundColor,
    this.borderRadius = 10,
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
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        elevation: 0,
      ),
      child: Text(buttonLabel),
    );
  }
}
