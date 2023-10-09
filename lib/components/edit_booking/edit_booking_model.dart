// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_booking_widget.dart' show EditBookingWidget;

class EditBookingModel extends FlutterFlowModel<EditBookingWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for personsName widget.
  TextEditingController? personsNameController;
  String? Function(BuildContext, String?)? personsNameControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for problemDescription widget.
  TextEditingController? problemDescriptionController;
  String? Function(BuildContext, String?)?
      problemDescriptionControllerValidator;
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    personsNameController?.dispose();
    problemDescriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
