// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/base/custom_util.dart';
import 'complete_profile_widget.dart' show CompleteProfileWidget;

class CompleteProfileModel extends CustomModel<CompleteProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  GetUploadedFile uploadedLocalFile =
      GetUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for yourName widget.
  TextEditingController? yourNameController;
  String? Function(BuildContext, String?)? yourNameControllerValidator;
  // State field(s) for yourAge widget.
  TextEditingController? yourAgeController;
  String? Function(BuildContext, String?)? yourAgeControllerValidator;
  // State field(s) for yourTitle widget.
  TextEditingController? yourTitleController;
  String? Function(BuildContext, String?)? yourTitleControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameController?.dispose();
    yourAgeController?.dispose();
    yourTitleController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
