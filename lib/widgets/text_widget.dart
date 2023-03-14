import 'package:flutter/material.dart';
class Textwidget extends StatelessWidget {
  const Textwidget (
  {Key? key,
  required this.label,
  this.fontsize=18,
    this.color,
    this.fontweight})
:super(key: key);
   final String label;
   final double fontsize;
   final Color? color;
   final FontWeight? fontweight;

   @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontsize,
        fontWeight: fontweight ?? FontWeight.w500,
      ),
    );

  }
}