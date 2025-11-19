import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../const/app_colors.dart';
import '../const/app_sizes.dart';
import 'custom_text.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintext;
  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? radius;
  final bool? readOnly;
  final Color? borderColor;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final ValueChanged<String>? onChanged;
  final bool obsecureText;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextInputType? textInputType;
  final int? maxLength;
  final bool? isTitle;
  final Color? bgColor;
  final bool? isPrefix;
  final bool? autofocus;
  final String? Function(String?)? validator;
  final String? errorText;

  const CustomTextfield({
    super.key,
    required this.controller,
    required this.hintext,
    required this.title,
    this.suffixIcon,
    this.prefixIcon,
    this.onChanged,
    this.obsecureText = false,
    this.textInputType,
    this.radius,
    this.borderColor,
    this.readOnly,
    this.onTap,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.isTitle = true,
    this.bgColor,
    this.isPrefix = true,
    this.autofocus,
    this.textAlign,
    this.textDirection,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = radius ?? 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Title
        if (isTitle ?? true)
          CustomText(
            text: title,
            fontSize: getWidth(18),
            fontWeight: FontWeight.w600,
            color: AppColors.textBlack,
          ),
        if (isTitle ?? true) SizedBox(height: getHeight(10)),

        Container(
          padding: EdgeInsets.symmetric(vertical: 14,horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: bgColor ?? AppColors.white,
            borderRadius: BorderRadius.circular(borderRadiusValue),
            border: Border.all(
              color: borderColor ?? AppColors.grey,
              width: 1.5,
            ),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines ?? 1,
            minLines: minLines,
            obscureText: obsecureText,
            obscuringCharacter: "*",
            keyboardType: textInputType,
            readOnly: readOnly ?? false,
            onTap: onTap,
            onChanged: onChanged,
            maxLength: maxLength,
            autofocus: autofocus ?? false,
            textAlign: textAlign ?? TextAlign.end,
            textDirection: textDirection ?? TextDirection.ltr,
            validator: validator,
            style: GoogleFonts.figtree(
              fontSize: getWidth(16, maxWidth: 18),
              fontWeight: FontWeight.w400,
              color: AppColors.textBlack,
            ),
            decoration: InputDecoration(
              hintText: hintext,
              hintTextDirection: textDirection ?? TextDirection.ltr,
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.zero,
              prefixIcon: (isPrefix ?? true) && prefixIcon != null
                  ? Padding(
                padding: EdgeInsets.zero,
                child: prefixIcon,
              )
                  : null,
              suffixIcon: suffixIcon,
              hintStyle: GoogleFonts.inter(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
              errorText: errorText,
            ),
          ),
        ),
      ],
    );
  }
}
