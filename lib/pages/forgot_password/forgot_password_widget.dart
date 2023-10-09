// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password_model.dart';

export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, ForgotPasswordModel.new);

    _model.emailAddressController ??= TextEditingController();
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
            color: FlutterFlowTheme.of(context).grayLight,
            size: 32,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: FlutterFlowTheme.of(context).headlineSmall,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Enter the email associated wit...',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
              child: TextFormField(
                controller: _model.emailAddressController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  labelStyle: FlutterFlowTheme.of(context).bodySmall,
                  hintText: 'Enter your email...',
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0x00000000),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  filled: true,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                validator:
                    _model.emailAddressControllerValidator.asValidator(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: GetButtonWidget(
                onPressed: () async {
                  if (_model.emailAddressController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Email required!',
                        ),
                      ),
                    );
                    return;
                  }
                  await authManager.resetPassword(
                    email: _model.emailAddressController.text,
                    context: context,
                  );
                },
                text: 'Send Reset Link',
                options: GetButtonOptions(
                  width: 190,
                  height: 50,
                  padding: EdgeInsetsDirectional.zero,
                  iconPadding: EdgeInsetsDirectional.zero,
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: FlutterFlowTheme.of(context).textColor,
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
    );
  }
}
