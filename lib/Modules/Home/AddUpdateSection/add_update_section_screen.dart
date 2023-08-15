// import 'ScreensLayout/l_add_update_section_screen.dart';
// import 'ScreensLayout/m_add_update_section_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:custom_widget/responsive/responsive_layout.dart';
//
// import 'ScreensLayout/s_add_update_section_screen.dart';
// import 'add_update_section_controller.dart';
//
//
//
// class AddUpdateSectionScreen extends ResponsiveStateFullMixin {
//
//   static String routeName = "section";
//   final int? sectionId;
//
//   const AddUpdateSectionScreen( {Key? key, this.sectionId}) : super(key: key);
//
//   @override
//   State createState() => _AddUpdateSectionScreenState();
// }
//
// class _AddUpdateSectionScreenState extends ResponsiveStateFullMixinState<AddUpdateSectionScreen> {
//   _AddUpdateSectionScreenState() : super(AddUpdateSectionController()) {
//     con = AddUpdateSectionController();
//   }
//
//   late AddUpdateSectionController con;
//
//
//   @override
//   void initState() {
//     super.initState();
//     con.getData(id: widget.sectionId,context: context);
//   }
//
//   @override
//   Widget buildLargeScreen(BuildContext context) {
//     return const LargeAddUpdateSectionScreen();
//   }
//
//   @override
//   Widget buildMediumScreen(BuildContext context) {
//     return const MediumAddUpdateSectionScreen();
//   }
//
//   @override
//   Widget buildSmallScreen(BuildContext context) {
//     return const SmallAddUpdateSectionScreen();
//   }
// }
