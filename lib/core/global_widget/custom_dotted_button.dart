
//

// import 'package:flutter/material.dart';
// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CustomDottedButton extends StatelessWidget {
//   final VoidCallback onTap;
//   final String text;

//   const CustomDottedButton({Key? key, required this.onTap, required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//       color: Colors.grey,
//       borderType: BorderType.RRect,
//       radius: Radius.circular(12),
//       dashPattern: [6, 3],
//       strokeWidth: 1.5,
//       child: InkWell(
//         onTap: onTap,
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Center(
//             child: Column(
//               children: [
//                 Icon(Icons.add_photo_alternate_outlined),
//                 Text(
//                   text,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
