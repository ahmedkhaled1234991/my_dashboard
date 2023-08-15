// import 'package:box_utils/box_utils.dart';
// import 'package:coop_new_dashboard/Models/menu_model.dart';
// import 'package:coop_new_dashboard/Utilities/theme_style_helper.dart';
// import 'package:coop_new_dashboard/Widgets/DashboardMenuWidget/dashboard_menu_widget.dart';
// import 'package:coop_new_dashboard/core/Language/locales.dart';
// import 'package:custom_widget/custom_widget.dart';
// import 'package:custom_widget/layout/loading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
//
// import '../../../../Utilities/constants/strings.dart';
// import '../../../../Utilities/theme_helper.dart';
// import '../../../../Widgets/custom_button_widget.dart';
// import '../../../Offers/AddUpdateOffer/ScreensLayout/l_add_update_offer_screen.dart';
// import '../add_update_section_controller.dart';
// class LargeAddUpdateSectionScreen extends StatefulWidget {
//   const LargeAddUpdateSectionScreen({Key? key}) : super(key: key);
//
//   @override
//   State createState() => _LargeAddUpdateSectionScreenState();
// }
//
// class _LargeAddUpdateSectionScreenState extends StateMVC<LargeAddUpdateSectionScreen>{
//   _LargeAddUpdateSectionScreenState() : super(AddUpdateSectionController()) {
//     con = AddUpdateSectionController();
//   }
//
//   late AddUpdateSectionController con;
//
//   @override
//   Widget build(BuildContext context) {
//     return  DashboardMenuWidget(
//       onRefresh: ()=> setState((){}),
//       menuBarRoute: MenuBarRoutes.home,
//       child: LoadingWidget(
//         loading: con.loading,
//         showAsOpacity: true,
//         child: Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//           child: Form(
//             key: con.formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(con.isUpdate?Strings.updateSection.tr:Strings.addSection.tr, style: ThemeStyleHelper.s32RegTextStyle.copyWith(color: primaryColor),),
//                     CustomButtonWidget.customWidget(
//                             onTap: ()=> con.insertUpdateSection(context),
//                             titleWidget: !con.isUpdate?CustomButtonWidget.addWidget:CustomButtonWidget.saveWidget,
//                           ),
//                   ],
//                 ),
//                 32.h.heightBox,
//                 const Divider(
//                   color: ThemeClass.accentColor,
//                   height: 1,
//                 ),
//                 20.h.heightBox,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     //*   Right
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //*   section
//                         FieldWithTitleColumn(
//                             title: Strings.section.tr,
//                             controller: con.sectionController,
//                           ),
//                         16.h.heightBox,
//                         //*   keywords
//                         FieldWithTitleColumn(
//                             title: Strings.keywords.tr,
//                             controller: con.keyWordsController,
//                           ),
//                       ],
//                     ),
//                     40.w.widthBox,
//                     //*   Left
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //*   arrangement
//                         FieldWithTitleColumn(
//                             title: Strings.arrangement.tr,
//                             controller: con.arrangementController,
//                           ),
//                         16.h.heightBox,
//                         //*   keyDescription
//                         FieldWithTitleColumn(
//                             title: Strings.keyDescription.tr,
//                             controller: con.keyDescriptionController,
//                           ),
//                       ],
//                     ),
//                   ],)
//               ],
//             ).addPaddingSymmetric(horizontal: 32.w, vertical: 30.h),
//           ),
//         ),
//       ),
//     );
//   }
// }
