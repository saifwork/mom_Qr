import 'dart:math';

import 'package:flutter/material.dart';
import 'colors.dart';

class PrimaryText extends StatelessWidget {
  final bool isLineThrough;
  final int? maxLine;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final double height;

  const PrimaryText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.color = AppColors.primaryText,
    this.size = 16,
    this.height = 1.3,
    this.maxLine,
    this.isLineThrough = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine!= null ? maxLine : null,
      overflow: maxLine== null ? TextOverflow.ellipsis : null,
      style: isLineThrough
          ? TextStyle(
              color: color,
              height: height,
              fontFamily: 'Poppins',
              fontSize: size,
              fontWeight: fontWeight,
              decoration: TextDecoration.lineThrough,
              decorationColor: AppColors.white,
              decorationThickness: 2.0,
            )
          : TextStyle(
              color: color,
              height: height,
              fontFamily: 'Poppins',
              fontSize: size,
              fontWeight: fontWeight,
            ),
    );
  }
}
