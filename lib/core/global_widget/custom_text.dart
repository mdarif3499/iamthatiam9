import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/app_colors.dart';



class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextAlign? textAlign;
  final double? height;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;

  const CustomText({
    super.key,
    required this.text,
    this.maxLines,
    this.textOverflow,
    this.fontSize,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.height,
    this.textDecoration,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      textDirection: textDirection ?? TextDirection.ltr,
      style: GoogleFonts.inter(
        fontSize: fontSize ?? 16,
        height: height,
        color: color ?? AppColors.textBlack,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: textDecoration,
      ),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}
