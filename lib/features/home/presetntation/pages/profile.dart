// import 'package:eccomerce/features/home/data/local/homeimages.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// import '../../../../constants/export.dart';
// import '../../../../globalwidget/export.dart';

// class Profile extends StatelessWidget {
//   const Profile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     return AppScaffold(
//         color: Appcolors.buttonColor.withOpacity(0.3),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CustomAppbar(title: 'Profile'),
//               SizedBox(height: size.height * 0.05),
//               Center(
//                   child: ClipRRect(
//                       borderRadius: BorderRadius.circular(size.width * 0.2),
//                       child: Image.asset(HomeImages.girl,
//                           width: size.width * 0.25,
//                           height: size.width * 0.25,
//                           fit: BoxFit.cover))),
//               SizedBox(height: size.height * 0.01),
//               const Center(
//                   child: AppText(
//                       text: 'Nonny Esodo', fontweight: FontWeight.w600)),
//               SizedBox(height: size.height * 0.07),
//               const AppText(text: 'Your Orders', fontweight: FontWeight.w600),
//               SizedBox(height: size.height * 0.03),
//               const AppText(text: 'Address', fontweight: FontWeight.w600),
//               SizedBox(height: size.height * 0.03),
//               const AppText(text: 'Transactions', fontweight: FontWeight.w600),
//               SizedBox(height: size.height * 0.03),
//               const AppText(
//                   text: 'Change Password', fontweight: FontWeight.w600),
//               SizedBox(height: size.height * 0.03),
//               const AppText(text: 'Log Out', fontweight: FontWeight.w600),
//               SizedBox(height: size.height * 0.03),
//             ],
//           ),
//         ));
//   }
// }
