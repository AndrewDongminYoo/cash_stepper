// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/base/custom_drop_down.dart';
import '/base/custom_icon_button.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import '/base/form_field_controller.dart';
import 'booking_old_model.dart';

export 'booking_old_model.dart';

class BookingOldWidget extends StatefulWidget {
  const BookingOldWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference? userProfile;

  @override
  State<BookingOldWidget> createState() => _BookingOldWidgetState();
}

class _BookingOldWidgetState extends State<BookingOldWidget> {
  late BookingOldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, BookingOldModel.new);

    _model.problemDescriptionController ??= TextEditingController();
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
        color: CustomTheme.of(context).darkBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
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
            final columnUsersRecord = snapshot.data!;
            return SingleChildScrollView(
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
                      'Book Appointment',
                      style: CustomTheme.of(context).headlineSmall,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Fill out the information below...',
                            style: CustomTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _model.emailController ??=
                          TextEditingController(
                        text: columnUsersRecord.email,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: CustomTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomTheme.of(context).background,
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
                        fillColor: CustomTheme.of(context).darkBackground,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: CustomTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: CustomTheme.of(context).primary,
                            fontWeight: FontWeight.bold,
                          ),
                      keyboardType: TextInputType.emailAddress,
                      validator:
                          _model.emailControllerValidator.asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _model.personsNameController ??=
                          TextEditingController(
                        text: columnUsersRecord.displayName,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Booking For',
                        labelStyle: CustomTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomTheme.of(context).background,
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
                        fillColor: CustomTheme.of(context).darkBackground,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: CustomTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: CustomTheme.of(context).textColor,
                            fontWeight: FontWeight.bold,
                          ),
                      validator: _model.personsNameControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: CustomDropDown<String>(
                      controller: _model.dropDownValueController ??=
                          FormFieldController<String>(null),
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
                      textStyle: CustomTheme.of(context).titleSmall.override(
                            fontFamily: 'Lexend',
                            color: CustomTheme.of(context).textColor,
                          ),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: CustomTheme.of(context).grayLight,
                        size: 15,
                      ),
                      fillColor: CustomTheme.of(context).darkBackground,
                      elevation: 3,
                      borderColor: CustomTheme.of(context).background,
                      borderWidth: 2,
                      borderRadius: 8,
                      margin:
                          const EdgeInsetsDirectional.fromSTEB(20, 4, 16, 4),
                      hidesUnderline: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: TextFormField(
                      controller: _model.problemDescriptionController,
                      decoration: InputDecoration(
                        labelText: "What's the problem?",
                        labelStyle: CustomTheme.of(context).bodyMedium,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomTheme.of(context).background,
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
                        fillColor: CustomTheme.of(context).darkBackground,
                        contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend',
                            color: CustomTheme.of(context).textColor,
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
                                l.name ==
                                GetLocalizations.of(context).languageCode,
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
                            color: CustomTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: CustomTheme.of(context).background,
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 0, 0),
                                      child: Text(
                                        'Choose Date',
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 4, 0, 0),
                                      child: Text(
                                        dateTimeFormat(
                                          'MMMMEEEEd',
                                          _model.datePicked,
                                          locale: GetLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: CustomTheme.of(context)
                                            .bodySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color: CustomTheme.of(context)
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
                                    CustomIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      buttonSize: 46,
                                      icon: Icon(
                                        Icons.date_range_outlined,
                                        color:
                                            CustomTheme.of(context).grayLight,
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
                        GetButtonWidget(
                          onPressed: () async {
                            context.pop();
                          },
                          text: 'Cancel',
                          options: GetButtonOptions(
                            width: 100,
                            height: 50,
                            padding: EdgeInsetsDirectional.zero,
                            iconPadding: EdgeInsetsDirectional.zero,
                            color: CustomTheme.of(context).background,
                            textStyle:
                                CustomTheme.of(context).titleSmall.override(
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
                        GetButtonWidget(
                          onPressed: () async {
                            await AppointmentsRecord.collection
                                .doc()
                                .set(createAppointmentsRecordData(
                                  appointmentType: _model.dropDownValue,
                                  appointmentTime: _model.datePicked,
                                  appointmentName:
                                      _model.personsNameController.text,
                                  appointmentDescription:
                                      _model.problemDescriptionController.text,
                                  appointmentEmail: currentUserEmail,
                                ));
                            context.pop();
                          },
                          text: 'Book Now',
                          options: GetButtonOptions(
                            width: 150,
                            height: 50,
                            padding: EdgeInsetsDirectional.zero,
                            iconPadding: EdgeInsetsDirectional.zero,
                            color: CustomTheme.of(context).primary,
                            textStyle:
                                CustomTheme.of(context).titleSmall.override(
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
            );
          },
        ),
      ),
    );
  }
}
