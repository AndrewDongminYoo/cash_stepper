// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_booking_model.dart';

export 'edit_booking_model.dart';

class EditBookingWidget extends StatefulWidget {
  const EditBookingWidget({
    Key? key,
    this.userAppointment,
  }) : super(key: key);

  final AppointmentsRecord? userAppointment;

  @override
  State<EditBookingWidget> createState() => _EditBookingWidgetState();
}

class _EditBookingWidgetState extends State<EditBookingWidget> {
  late EditBookingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, EditBookingModel.new);

    _model.personsNameController ??=
        TextEditingController(text: widget.userAppointment?.appointmentName);
    _model.problemDescriptionController ??= TextEditingController(
        text: widget.userAppointment?.appointmentDescription);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).darkBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(
                thickness: 3,
                indent: 150,
                endIndent: 150,
                color: Color(0xFF465056),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                child: Text(
                  'Edit Appointment',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                      child: Text(
                        'Edit the fields below in order...',
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Emails will be sent to:',
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                child: Text(
                  currentUserEmail,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: TextFormField(
                  controller: _model.personsNameController,
                  decoration: InputDecoration(
                    labelText: 'Booking For',
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).background,
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
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).darkBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                        fontWeight: FontWeight.bold,
                      ),
                  validator: _model.personsNameControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(
                    _model.dropDownValue ??=
                        widget.userAppointment?.appointmentType,
                  ),
                  options: const [
                    'Type of Appointment',
                    'Doctors Visit',
                    'Routine Checkup',
                    'Scan/Update'
                  ],
                  onChanged: (val) =>
                      setState(() => _model.dropDownValue = val),
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 60,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                      ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: FlutterFlowTheme.of(context).grayLight,
                    size: 15,
                  ),
                  fillColor: FlutterFlowTheme.of(context).darkBackground,
                  elevation: 3,
                  borderColor: FlutterFlowTheme.of(context).background,
                  borderWidth: 2,
                  borderRadius: 8,
                  margin: const EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                  hidesUnderline: true,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: TextFormField(
                  controller: _model.problemDescriptionController,
                  decoration: InputDecoration(
                    labelText: "What's the problem?",
                    labelStyle: FlutterFlowTheme.of(context).bodyMedium,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).background,
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
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).darkBackground,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
                      ),
                  maxLines: 8,
                  keyboardType: TextInputType.multiline,
                  validator: _model.problemDescriptionControllerValidator
                      .asValidator(context),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await DatePicker.showDatePicker(
                      context,
                      onConfirm: (date) {
                        safeSetState(() {
                          _model.datePicked = date;
                        });
                      },
                      currentTime: getCurrentTimestamp,
                      minTime: DateTime(0, 0, 0),
                      locale: LocaleType.values.firstWhere(
                        (l) =>
                            l.name == FFLocalizations.of(context).languageCode,
                        orElse: () => LocaleType.en,
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).darkBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).background,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Text(
                                    'Choose Date',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Lexend',
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 4, 0, 0),
                                  child: Text(
                                    dateTimeFormat(
                                      'MMMMEEEEd',
                                      widget.userAppointment!.appointmentTime,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: FlutterFlowTheme.of(context)
                                              .tertiary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 8, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  buttonSize: 46,
                                  icon: Icon(
                                    Icons.date_range_outlined,
                                    color:
                                        FlutterFlowTheme.of(context).grayLight,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    print('IconButton pressed ...');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        context.pop();
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 100,
                        height: 50,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: FlutterFlowTheme.of(context).background,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        await widget.userAppointment!.reference
                            .update(createAppointmentsRecordData(
                          appointmentName: _model.personsNameController.text,
                          appointmentType: _model.dropDownValue,
                          appointmentDescription:
                              _model.problemDescriptionController.text,
                          appointmentTime: _model.datePicked,
                        ));
                        context.pop();
                      },
                      text: 'Save Changes',
                      options: FFButtonOptions(
                        width: 150,
                        height: 50,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Lexend',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
