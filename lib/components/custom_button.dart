import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double textHeight;
  final TextStyle textStyle;
  final Color borderColor;

  CustomButton({
    Key? key,
    required this.text,
    required this.bgColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    required this.onPressed,
    this.borderRadius = 5.0,
    this.textHeight = 40,
    this.borderColor = Colors.transparent,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: double.infinity,
        height: textHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            side: BorderSide(color: borderColor),
          ),
          onPressed: onPressed,
          child: FittedBox(
            child: Row(children: [Text(text, style: textStyle)]),
          ),
        ),
      ),
    );
  }
}
