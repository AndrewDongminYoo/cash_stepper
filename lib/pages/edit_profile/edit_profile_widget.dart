// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import '/base/upload_data.dart';
import 'edit_profile_model.dart';

export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference? userProfile;

  @override
  State<EditProfileWidget> createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, EditProfileModel.new);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: CustomTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40,
                height: 40,
                child: SpinKitPumpingHeart(
                  color: CustomTheme.of(context).primary,
                  size: 40,
                ),
              ),
            ),
          );
        }
        final editProfileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: CustomTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: CustomTheme.of(context).grayLight,
                size: 32,
              ),
            ),
            title: Text(
              'Edit Profile',
              style: CustomTheme.of(context).headlineSmall,
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0,
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: Image.asset(
                  'assets/images/login_bg@2x.png',
                ).image,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: CustomTheme.of(context).darkBackground,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      width: 80,
                      height: 80,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          editProfileUsersRecord.photoUrl,
                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/finance-app-sample-kugwu4/assets/ijvuhvqbvns6/uiAvatar@2x.png',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: GetButtonWidget(
                      onPressed: () async {
                        final selectedMedia = await selectMedia(
                          mediaSource: MediaSource.photoGallery,
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          setState(() => _model.isDataUploading = true);
                          var selectedUploadedFiles = <GetUploadedFile>[];

                          var downloadUrls = <String>[];
                          try {
                            showUploadMessage(
                              context,
                              'Uploading file...',
                              showLoading: true,
                            );
                            selectedUploadedFiles = selectedMedia
                                .map((m) => GetUploadedFile(
                                      name: m.storagePath.split('/').last,
                                      bytes: m.bytes,
                                      height: m.dimensions?.height,
                                      width: m.dimensions?.width,
                                      blurHash: m.blurHash,
                                    ))
                                .toList();

                            downloadUrls = (await Future.wait(
                              selectedMedia.map(
                                (m) async => uploadData(m.storagePath, m.bytes),
                              ),
                            ))
                                .where((u) => u != null)
                                .map((u) => u!)
                                .toList();
                          } finally {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            _model.isDataUploading = false;
                          }
                          if (selectedUploadedFiles.length ==
                                  selectedMedia.length &&
                              downloadUrls.length == selectedMedia.length) {
                            setState(() {
                              _model.uploadedLocalFile =
                                  selectedUploadedFiles.first;
                              _model.uploadedFileUrl = downloadUrls.first;
                            });
                            showUploadMessage(context, 'Success!');
                          } else {
                            setState(() {});
                            showUploadMessage(context, 'Failed to upload data');
                            return;
                          }
                        }
                      },
                      text: 'Change Photo',
                      options: GetButtonOptions(
                        width: 140,
                        height: 40,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: CustomTheme.of(context).secondaryBackground,
                        textStyle: CustomTheme.of(context).bodySmall,
                        elevation: 0,
                        borderSide: BorderSide(
                          color: CustomTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: _model.yourNameController ??=
                          TextEditingController(
                        text: editProfileUsersRecord.displayName,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        labelStyle: CustomTheme.of(context).bodySmall,
                        hintText: 'Please enter a valid number...',
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
                        filled: true,
                        fillColor: CustomTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20, 24, 20, 24),
                      ),
                      style: CustomTheme.of(context).bodyMedium,
                      validator: _model.yourNameControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: _model.yourEmailController ??=
                          TextEditingController(
                        text: editProfileUsersRecord.email,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: CustomTheme.of(context).bodySmall,
                        hintText: 'Your email',
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
                        filled: true,
                        fillColor: CustomTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20, 24, 20, 24),
                      ),
                      style: CustomTheme.of(context).bodyMedium,
                      keyboardType: TextInputType.emailAddress,
                      validator: _model.yourEmailControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: _model.yourAgeController ??=
                          TextEditingController(
                        text: editProfileUsersRecord.age.toString(),
                      ),
                      decoration: InputDecoration(
                        labelText: 'Your Age',
                        labelStyle: CustomTheme.of(context).bodySmall,
                        hintText: 'i.e. 34',
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
                        filled: true,
                        fillColor: CustomTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20, 24, 20, 24),
                      ),
                      style: CustomTheme.of(context).bodyMedium,
                      keyboardType: TextInputType.number,
                      validator: _model.yourAgeControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                    child: TextFormField(
                      controller: _model.yourTitleController ??=
                          TextEditingController(
                        text: editProfileUsersRecord.userTitle,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Your Title',
                        labelStyle: CustomTheme.of(context).bodySmall,
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
                        filled: true,
                        fillColor: CustomTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            20, 24, 20, 24),
                      ),
                      style: CustomTheme.of(context).bodyMedium,
                      validator: _model.yourTitleControllerValidator
                          .asValidator(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: GetButtonWidget(
                      onPressed: () async {
                        await editProfileUsersRecord.reference
                            .update(createUsersRecordData(
                          displayName: _model.yourNameController.text,
                          email: _model.yourEmailController.text,
                          age: int.tryParse(_model.yourAgeController.text),
                          userTitle: valueOrDefault<String>(
                            _model.yourTitleController.text,
                            'Badass Geek',
                          ),
                          photoUrl: _model.uploadedFileUrl,
                        ));
                        context.pop();
                      },
                      text: 'Save Changes',
                      options: GetButtonOptions(
                        width: 230,
                        height: 56,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: CustomTheme.of(context).primary,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend',
                              color: CustomTheme.of(context).textColor,
                            ),
                        elevation: 3,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
