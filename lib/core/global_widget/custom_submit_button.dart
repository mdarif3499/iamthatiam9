import 'package:flutter/material.dart';
import '../const/app_colors.dart';
import '../const/app_sizes.dart';
import 'custom_text.dart';

class CustomSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Widget? icon;
  final double? radius;
  final Color? bgColor;
  final Color? border;
  final Color? textColor;
  final double? fontSize;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final double? borderWidth;

  const CustomSubmitButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
    this.bgColor,
    this.border,
    this.textColor,
    this.radius,
    this.fontSize,
    this.height,
    this.fontWeight,
    this.borderWidth,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 20),
      child: Ink(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(radius ?? 20),
          border: Border.all(
            color: border ?? AppColors.primaryColor,
            width: borderWidth ?? 1,
          ),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 20),
          splashColor: Colors.white.withValues(alpha: .3),
          onTap: onTap,
          child: Container(
            height: height ?? getWidth(46),
            width: width ?? double.infinity,
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  const SizedBox(width: 5),
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Center(child: icon),
                  ),
                ],

                CustomText(
                  text: text,

                  fontSize: fontSize ?? getWidth(22),
                  fontWeight: fontWeight ?? FontWeight.w600,
                  color: textColor ?? AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
