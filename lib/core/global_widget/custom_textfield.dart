import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/const/app_colors.dart';
import '../../core/const/app_sizes.dart';
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
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadiusValue = radius ?? 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        if (isTitle ?? true)
          CustomText(
            text: title,
            fontSize: getWidth(16),
            fontWeight: FontWeight.w500,
            color: AppColors.textBlack,
          ),
        if (isTitle ?? true) SizedBox(height: getHeight(10)),

        Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFE7E7E7),
            borderRadius: BorderRadius.circular(borderRadiusValue),
          ),
          alignment: Alignment.center,
          child: TextFormField(
            controller: controller,
            maxLines: maxLines ?? 1,
            minLines: minLines,
            obscureText: obsecureText,
            keyboardType: textInputType ?? TextInputType.text,
            textDirection: TextDirection.ltr,
            textAlign: textAlign ?? TextAlign.start,
            style: GoogleFonts.figtree(
              fontSize: getWidth(16, maxWidth: 18),
              fontWeight: FontWeight.w400,
              color: AppColors.textBlack,
            ),
            decoration: InputDecoration(
              hintText: hintext,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
              hintStyle: GoogleFonts.figtree(
                fontSize: getWidth(16, maxWidth: 18),
                fontWeight: FontWeight.w400,
                color: const Color(0xFF6B6B6B),
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(right: 4), // adjust spacing
                      child: SizedBox(
                        height: getHeight(25),
                        width: getWidth(25),
                        child: prefixIcon, // now size will respect this
                      ),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(
                minWidth: 0, // set to 0 or remove entirely
                minHeight: 0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
