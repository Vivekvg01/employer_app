import 'package:flutter/material.dart';

class CustomRectButton extends StatelessWidget {
  final String buttonLabel;
  final Function onButtonClicked;

  const CustomRectButton({
    Key? key,
    required this.buttonLabel,
    required this.onButtonClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onButtonClicked();
      },
      style: ElevatedButton.styleFrom(
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
