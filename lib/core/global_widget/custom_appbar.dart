import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/app_colors.dart';
import 'custom_text.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final double? size;
  final FontWeight? fontWeight;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.bottom,
    this.leadingWidth,
    this.leading,
    this.automaticallyImplyLeading,
    this.size,
    this.fontWeight,
  });
  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      forceMaterialTransparency: true,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(padding: EdgeInsets.only(left: 10), child: SizedBox(width: 10,height: 10,child: leading)),
      ),
      title: CustomText(
        text: title,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.textBlack,
      ),
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }
}