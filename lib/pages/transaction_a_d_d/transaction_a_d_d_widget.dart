// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/base/custom_animations.dart';
import '/base/custom_drop_down.dart';
import '/base/custom_icon_button.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import '/base/form_field_controller.dart';
import 'transaction_a_d_d_model.dart';

export 'transaction_a_d_d_model.dart';

class TransactionADDWidget extends StatefulWidget {
  const TransactionADDWidget({Key? key}) : super(key: key);

  @override
  State<TransactionADDWidget> createState() => _TransactionADDWidgetState();
}

class _TransactionADDWidgetState extends State<TransactionADDWidget>
    with TickerProviderStateMixin {
  late TransactionADDModel _model;

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
    _model = createModel(context, TransactionADDModel.new);

    _model.textController1 ??= TextEditingController();
    _model.spentAtController ??= TextEditingController();
    _model.reasonController ??= TextEditingController();
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomTheme.of(context).tertiary,
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
                  color: CustomTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Transaction',
                            style: CustomTheme.of(context).displaySmall,
                          ),
                          Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: CustomTheme.of(context).primaryBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: CustomIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 48,
                              icon: Icon(
                                Icons.close_rounded,
                                color: CustomTheme.of(context).secondaryText,
                                size: 30,
                              ),
                              onPressed: () async {
                                context.pop();
                              },
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.8,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.sizeOf(context).width * 0.8,
                        ),
                        decoration: const BoxDecoration(),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: TextFormField(
                            controller: _model.textController1,
                            decoration: InputDecoration(
                              labelStyle: CustomTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: CustomTheme.of(context).grayLight,
                                    fontWeight: FontWeight.w300,
                                  ),
                              hintText: 'Amount',
                              hintStyle: CustomTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: CustomTheme.of(context).grayLight,
                                    fontWeight: FontWeight.w300,
                                  ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: CustomTheme.of(context).alternate,
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
                                color: CustomTheme.of(context).primaryText,
                                size: 32,
                              ),
                            ),
                            style: CustomTheme.of(context).displaySmall,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            validator: _model.textController1Validator
                                .asValidator(context),
                          ).animateOnPageLoad(
                              animationsMap['textFieldOnPageLoadAnimation1']!),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: _model.spentAtController,
                          decoration: InputDecoration(
                            labelText: 'Spent At',
                            labelStyle: CustomTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).alternate,
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
                          style: CustomTheme.of(context).bodySmall,
                          validator: _model.spentAtControllerValidator
                              .asValidator(context),
                        ).animateOnPageLoad(
                            animationsMap['textFieldOnPageLoadAnimation2']!),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
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
                                    color: CustomTheme.of(context).primary,
                                    size: 40,
                                  ),
                                ),
                              );
                            }
                            final budgetBudgetListRecordList = snapshot.data!;
                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final budgetBudgetListRecord =
                                budgetBudgetListRecordList.isNotEmpty
                                    ? budgetBudgetListRecordList.first
                                    : null;
                            return CustomDropDown<String>(
                              controller: _model.budgetValueController ??=
                                  FormFieldController<String>(null),
                              options: budgetBudgetListRecord!.budget,
                              onChanged: (val) =>
                                  setState(() => _model.budgetValue = val),
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 60,
                              textStyle: CustomTheme.of(context).bodyMedium,
                              hintText: 'Select Budget',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: CustomTheme.of(context).grayLight,
                                size: 15,
                              ),
                              fillColor:
                                  CustomTheme.of(context).secondaryBackground,
                              elevation: 2,
                              borderColor: CustomTheme.of(context).alternate,
                              borderWidth: 2,
                              borderRadius: 8,
                              margin: const EdgeInsetsDirectional.fromSTEB(
                                  20, 20, 12, 20),
                              hidesUnderline: true,
                            ).animateOnPageLoad(
                                animationsMap['dropDownOnPageLoadAnimation']!);
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: _model.reasonController,
                          decoration: InputDecoration(
                            labelStyle: CustomTheme.of(context).bodyMedium,
                            hintText: 'Reason',
                            hintStyle: CustomTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: CustomTheme.of(context).alternate,
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
                          style: CustomTheme.of(context).bodyMedium,
                          maxLines: 4,
                          validator: _model.reasonControllerValidator
                              .asValidator(context),
                        ).animateOnPageLoad(
                            animationsMap['textFieldOnPageLoadAnimation3']!),
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
                          queryBuilder: (budgetsRecord) => budgetsRecord.where(
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
                                  color: CustomTheme.of(context).primary,
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
                              await TransactionsRecord.collection.doc().set({
                                ...createTransactionsRecordData(
                                  transactionAmount:
                                      _model.textController1.text,
                                  transactionName:
                                      _model.spentAtController.text,
                                  transactionTime: getCurrentTimestamp,
                                  transactionReason:
                                      _model.reasonController.text,
                                  user: currentUserReference,
                                  budgetAssociated:
                                      buttonBudgetsRecord?.reference,
                                ),
                                ...mapToFirestore(
                                  {
                                    'categoryName': [_model.budgetValue],
                                  },
                                ),
                              });
                              Navigator.of(context).pop();
                            },
                            text: 'Add Transaction',
                            options: GetButtonOptions(
                              width: 300,
                              height: 70,
                              padding: EdgeInsetsDirectional.zero,
                              iconPadding: EdgeInsetsDirectional.zero,
                              color: CustomTheme.of(context).tertiary,
                              textStyle: CustomTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Lexend',
                                    color: CustomTheme.of(context).textColor,
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
              'Tap above to complete request',
              style: CustomTheme.of(context).bodyMedium.override(
                    fontFamily: 'Lexend',
                    color: const Color(0x43000000),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
