// import 'package:coop_new_dashboard/Models/section_model.dart';
// import 'package:coop_new_dashboard/Modules/Home/ViewSections/home_controller.dart';
// import 'package:coop_new_dashboard/Utilities/dialog_helper.dart';
// import 'package:coop_new_dashboard/core/Language/locales.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:mvc_pattern/mvc_pattern.dart';
// import '../../../Utilities/constants/strings.dart';
// import '../section_data_handler.dart';
//
// class AddUpdateSectionController extends ControllerMVC {
//   // singleton
//   factory AddUpdateSectionController() {
//     _this ??= AddUpdateSectionController._();
//     return _this!;
//   }
//   static AddUpdateSectionController? _this;
//   AddUpdateSectionController._();
//
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   late TextEditingController sectionController,arrangementController,keyWordsController ,keyDescriptionController;
//   bool loading = false;
//   SectionModel? sectionModel;
//   int? sectionId;
//
//   bool get isUpdate => loading?(sectionId!=null):(sectionModel!=null);
//
//   @override
//   void initState() {
//     sectionController = TextEditingController();
//     arrangementController = TextEditingController();
//     keyWordsController = TextEditingController();
//     keyDescriptionController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     sectionController.dispose();
//     arrangementController.dispose();
//     keyWordsController.dispose();
//     keyDescriptionController.dispose();
//     super.dispose();
//   }
//
//
//   Future getData({int? id,required BuildContext context})async{
//     sectionId = id;
//     sectionModel = null;
//     if(id !=null){
//       setState(() {loading = true;});
//       final res = await SectionDataHandler.getSectionById(id: id);
//       setState(() {loading = false;});
//       res.fold((l){
//         DialogsHelper.dialog(context: context, message: l.message).errorDialog();
//       }, (r){
//         sectionModel = r;
//       });
//     }
//     setData();
//   }
//
//   void setData(){
//     sectionController.text = "section";
//     arrangementController.text = "arrangement";
//     keyWordsController.text = "keyWords";
//     keyDescriptionController.text = "keyDescription";
//
//     setState(() { });
//   }
//
//   Future insertUpdateSection(BuildContext context)async{
//     if(!(formKey.currentState?.validate()??false)) return;
//     setState(() {loading = true;});
//     final result = await SectionDataHandler.insertUpdateSection(
//       sectionModel: SectionModel(),
//     );
//     setState(() {loading = false;});
//     result.fold((l){
//       DialogsHelper.dialog(context: context, message: l.message).errorDialog();
//     }, (r){
//       DialogsHelper.dialog(context: context, message: isUpdate? Strings.updatedSectionSuccessfully.tr : Strings.addedSectionSuccessfully.tr).successDialog();
//     });
//
//     if(sectionId == null){
//       HomeController().sectionsList.add(SectionModel());
//     }
//   }
//
//
// }
