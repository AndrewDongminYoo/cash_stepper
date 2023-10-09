// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'transaction_e_d_i_t_model.dart';

export 'transaction_e_d_i_t_model.dart';

class TransactionEDITWidget extends StatefulWidget {
  const TransactionEDITWidget({
    Key? key,
    this.transactionDetails,
  }) : super(key: key);

  final DocumentReference? transactionDetails;

  @override
  State<TransactionEDITWidget> createState() => _TransactionEDITWidgetState();
}

class _TransactionEDITWidgetState extends State<TransactionEDITWidget>
    with TickerProviderStateMixin {
  late TransactionEDITModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0, 40),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: const Offset(0, 80),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 170.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(0, 100),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 200.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 230.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 230.ms,
          duration: 600.ms,
          begin: const Offset(0, 120),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 230.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, TransactionEDITModel.new);

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transactionDetails!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            body: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: SpinKitPumpingHeart(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40,
                ),
              ),
            ),
          );
        }
        final transactionEDITTransactionsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          body: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Edit Transaction',
                                style:
                                    FlutterFlowTheme.of(context).displaySmall,
                              ),
                              Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 48,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 30,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: TextFormField(
                              controller: _model.textController1 ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionAmount,
                              ),
                              decoration: InputDecoration(
                                labelStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      fontWeight: FontWeight.w300,
                                    ),
                                hintText: 'Amount',
                                hintStyle: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: FlutterFlowTheme.of(context)
                                          .grayLight,
                                      fontWeight: FontWeight.w300,
                                    ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: UnderlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 24, 24, 24),
                                prefixIcon: Icon(
                                  Icons.attach_money_rounded,
                                  color: FlutterFlowTheme.of(context).textColor,
                                  size: 32,
                                ),
                              ),
                              style: FlutterFlowTheme.of(context).displaySmall,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              validator: _model.textController1Validator
                                  .asValidator(context),
                            ).animateOnPageLoad(animationsMap[
                                'textFieldOnPageLoadAnimation1']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: TextFormField(
                              controller: _model.spentAtController ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionName,
                              ),
                              decoration: InputDecoration(
                                labelText: 'Spent At',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 24, 24, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              validator: _model.spentAtControllerValidator
                                  .asValidator(context),
                            ).animateOnPageLoad(animationsMap[
                                'textFieldOnPageLoadAnimation2']!),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: StreamBuilder<List<BudgetListRecord>>(
                              stream: queryBudgetListRecord(
                                queryBuilder: (budgetListRecord) =>
                                    budgetListRecord.where(
                                  'budgetUser',
                                  isEqualTo: currentUserReference,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: SpinKitPumpingHeart(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 40,
                                      ),
                                    ),
                                  );
                                }
                                final budgetBudgetListRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final budgetBudgetListRecord =
                                    budgetBudgetListRecordList.isNotEmpty
                                        ? budgetBudgetListRecordList.first
                                        : null;
                                return FlutterFlowDropDown<String>(
                                  controller: _model.budgetValueController ??=
                                      FormFieldController<String>(null),
                                  options: budgetBudgetListRecord!.budget,
                                  onChanged: (val) =>
                                      setState(() => _model.budgetValue = val),
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 60,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: 'Select Budget',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    size: 15,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2,
                                  borderRadius: 8,
                                  margin: const EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 12, 20),
                                  hidesUnderline: true,
                                ).animateOnPageLoad(animationsMap[
                                    'dropDownOnPageLoadAnimation']!);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 16, 0, 0),
                            child: TextFormField(
                              controller: _model.reasonController ??=
                                  TextEditingController(
                                text: transactionEDITTransactionsRecord
                                    .transactionReason,
                              ),
                              decoration: InputDecoration(
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                hintText: 'Reason',
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodySmall,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                contentPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        20, 40, 24, 0),
                              ),
                              style: FlutterFlowTheme.of(context).bodyMedium,
                              maxLines: 4,
                              validator: _model.reasonControllerValidator
                                  .asValidator(context),
                            ).animateOnPageLoad(animationsMap[
                                'textFieldOnPageLoadAnimation3']!),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          StreamBuilder<List<BudgetsRecord>>(
                            stream: queryBudgetsRecord(
                              queryBuilder: (budgetsRecord) =>
                                  budgetsRecord.where(
                                'budgetName',
                                isEqualTo: _model.budgetValue,
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: SpinKitPumpingHeart(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 40,
                                    ),
                                  ),
                                );
                              }
                              final buttonBudgetsRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final buttonBudgetsRecord =
                                  buttonBudgetsRecordList.isNotEmpty
                                      ? buttonBudgetsRecordList.first
                                      : null;
                              return GetButtonWidget(
                                onPressed: () async {
                                  await transactionEDITTransactionsRecord
                                      .reference
                                      .update(createTransactionsRecordData(
                                    transactionName:
                                        _model.spentAtController.text,
                                    transactionAmount:
                                        _model.textController1.text,
                                    transactionReason:
                                        _model.reasonController.text,
                                    budgetAssociated:
                                        buttonBudgetsRecord?.reference,
                                  ));
                                  context.pop();
                                },
                                text: 'Update Transaction',
                                options: GetButtonOptions(
                                  width: 340,
                                  height: 70,
                                  padding: EdgeInsetsDirectional.zero,
                                  iconPadding: EdgeInsetsDirectional.zero,
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: FlutterFlowTheme.of(context)
                                            .textColor,
                                      ),
                                  elevation: 0,
                                  borderSide: const BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Tap above to save your changes...',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        color: const Color(0x43000000),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
