// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'request_funds_model.dart';

export 'request_funds_model.dart';

class RequestFundsWidget extends StatefulWidget {
  const RequestFundsWidget({Key? key}) : super(key: key);

  @override
  State<RequestFundsWidget> createState() => _RequestFundsWidgetState();
}

class _RequestFundsWidgetState extends State<RequestFundsWidget> {
  late RequestFundsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, RequestFundsModel.new);

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController();
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
      body: Column(
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
                          'Request Funds',
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
                    Padding(
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
                          hintText: r'$ Amount',
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
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 24, 24, 24),
                        ),
                        style: CustomTheme.of(context).displaySmall,
                        textAlign: TextAlign.center,
                        validator: _model.textController1Validator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: CustomDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(null),
                        options: const [
                          'Office Budget',
                          'External Transfer',
                          'ACH Payment'
                        ],
                        onChanged: (val) =>
                            setState(() => _model.dropDownValue = val),
                        width: MediaQuery.sizeOf(context).width * 0.9,
                        height: 60,
                        textStyle: CustomTheme.of(context).bodyMedium,
                        hintText: 'Select Transfer',
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
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: TextFormField(
                        controller: _model.textController2,
                        decoration: InputDecoration(
                          labelStyle: CustomTheme.of(context).bodyMedium,
                          hintText: 'Reason',
                          hintStyle: CustomTheme.of(context).bodyMedium,
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
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 32, 24, 0),
                        ),
                        style: CustomTheme.of(context).bodyMedium,
                        maxLines: 4,
                        validator: _model.textController2Validator
                            .asValidator(context),
                      ),
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
                    GetButtonWidget(
                      onPressed: () async {
                        await context.pushNamed(
                          'transferComplete',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 220),
                            ),
                          },
                        );
                      },
                      text: 'Request Funds',
                      options: GetButtonOptions(
                        width: 300,
                        height: 70,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: CustomTheme.of(context).tertiary,
                        textStyle:
                            CustomTheme.of(context).displaySmall.override(
                                  fontFamily: 'Lexend',
                                  color: CustomTheme.of(context).textColor,
                                ),
                        elevation: 0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
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
    );
  }
}
