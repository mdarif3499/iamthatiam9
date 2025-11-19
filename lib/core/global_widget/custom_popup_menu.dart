
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../const/app_colors.dart';
import '../const/app_sizes.dart';
import '../const/icons_path.dart';
import 'custom_text.dart';

class CustomPopupMenu extends StatelessWidget {
  const CustomPopupMenu({
    super.key,
    required this.controller,
    required this.selectedValue,
    required this.menuItems,
    this.iconsPath,
    required this.hintText,
    required this.title,
  });

  final RxString selectedValue;
  final List<String> menuItems;
  final String? iconsPath;
  final String hintText, title;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: getWidth(16, maxWidth: 18),
          fontWeight: FontWeight.w500,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: GestureDetector(
            onTap: () {
              _showPopupMenu(context);
            },
            child: Container(
              height: getHeight(52),
              padding: EdgeInsets.only(left: IconsPath != null ? 14 : 0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,

                border: Border.all(color: AppColors.textBlack, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() {
                        return SizedBox(
                          width: screenWidth() * 0.6,
                          child: CustomText(
                            text: selectedValue.value.isNotEmpty
                                ? selectedValue.value
                                : hintText,
                            fontSize: getWidth(16, maxWidth: 18),
                            fontWeight: FontWeight.w400,
                            color: AppColors.textBlack,
                          ),
                        );
                      }),
                    ],
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      popupMenuTheme: PopupMenuThemeData(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: PopupMenuButton<String>(
                      offset: Offset(0, 60),
                      onSelected: (value) {
                        selectedValue.value = value;
                      },
                      itemBuilder: (BuildContext context) {
                        return menuItems.map((item) {
                          return PopupMenuItem<String>(
                            value: item,
                            child: SizedBox(
                              width: screenWidth() * 0.6,
                              child: CustomText(
                                text: item,
                                fontSize: getWidth(16, maxWidth: 18),
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlack,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        }).toList();
                      },
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset target = button.localToGlobal(Offset.zero, ancestor: overlay);

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(target, target),
      Offset.zero & overlay.size,
    );

    showMenu<String>(
      context: context,
      position: position,
      items: menuItems.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: SizedBox(
            width: screenWidth() * 0.6,
            child: CustomText(
              text: item,
              fontSize: getWidth(14),
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
      // Optional: You can set a default color for manual popup as well (though it's less effective than Theme)
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ).then((value) {
      if (value != null) {
        selectedValue.value = value;
      }
    });
  }
}
