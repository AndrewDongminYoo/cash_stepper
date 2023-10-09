// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_a_d_d_widget.dart' show TransactionADDWidget;

class TransactionADDModel extends FlutterFlowModel<TransactionADDWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an amount';
    }

    return null;
  }

  // State field(s) for SpentAt widget.
  TextEditingController? spentAtController;
  String? Function(BuildContext, String?)? spentAtControllerValidator;
  // State field(s) for budget widget.
  String? budgetValue;
  FormFieldController<String>? budgetValueController;
  // State field(s) for reason widget.
  TextEditingController? reasonController;
  String? Function(BuildContext, String?)? reasonControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
  }

  @override
  void dispose() {
    textController1?.dispose();
    spentAtController?.dispose();
    reasonController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
