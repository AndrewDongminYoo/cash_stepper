// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_page_model.dart';

export 'login_page_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  late LoginPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, LoginPageModel.new);

    _model.emailAddressLoginController ??= TextEditingController();
    _model.passwordLoginController ??= TextEditingController();
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
      body: Column(
        children: [
          Row(
            children: [
              Container(
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
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 24, 0, 20),
                        child: Row(
                          children: [
                            if (Theme.of(context).brightness == Brightness.dark)
                              Image.asset(
                                'assets/images/finWallet_logo_landscape.png',
                                width: 170,
                                height: 60,
                                fit: BoxFit.fitWidth,
                              ),
                            if (!(Theme.of(context).brightness ==
                                Brightness.dark))
                              Image.asset(
                                'assets/images/finWallet_logo_landscapeDark@3x.png',
                                width: 170,
                                height: 60,
                                fit: BoxFit.fitWidth,
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Welcome back',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Login to access your account b...',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 0),
                                child: TextFormField(
                                  controller:
                                      _model.emailAddressLoginController,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter your email...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .emailAddressLoginControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 0),
                                child: TextFormField(
                                  controller: _model.passwordLoginController,
                                  obscureText: !_model.passwordLoginVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
                                    hintText: 'Enter your password...',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodySmall,
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
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model.passwordLoginVisibility =
                                            !_model.passwordLoginVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.passwordLoginVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: const Color(0x98FFFFFF),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .passwordLoginControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 24, 0, 24),
                                    child: GetButtonWidget(
                                      onPressed: () async {
                                        await context
                                            .pushNamed('forgotPassword');
                                      },
                                      text: 'Forgot Password?',
                                      options: GetButtonOptions(
                                        width: 170,
                                        height: 40,
                                        padding: EdgeInsetsDirectional.zero,
                                        iconPadding: EdgeInsetsDirectional.zero,
                                        color: const Color(0x001A1F24),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodySmall,
                                        elevation: 0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  GetButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context).prepareAuthEvent();

                                      final user =
                                          await authManager.signInWithEmail(
                                        context,
                                        _model.emailAddressLoginController.text,
                                        _model.passwordLoginController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      context.goNamedAuth(
                                          'MY_Card', context.mounted);
                                    },
                                    text: 'Login',
                                    options: GetButtonOptions(
                                      width: 120,
                                      height: 50,
                                      padding: EdgeInsetsDirectional.zero,
                                      iconPadding: EdgeInsetsDirectional.zero,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      elevation: 3,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await context
                                          .pushNamed('registerAccount');
                                    },
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.8,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an account?",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(24, 0, 4, 0),
                                            child: Text(
                                              'Create',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 24,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: GetButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final user =
                                await authManager.signInAnonymously(context);
                            if (user == null) {
                              return;
                            }

                            await BudgetListRecord.collection
                                .doc()
                                .set(createBudgetListRecordData(
                                  budgetUser: currentUserReference,
                                ));

                            context.goNamedAuth('MY_Card', context.mounted);
                          },
                          text: 'Continue as Guest',
                          options: GetButtonOptions(
                            width: 230,
                            height: 50,
                            padding: EdgeInsetsDirectional.zero,
                            iconPadding: EdgeInsetsDirectional.zero,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Lexend',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
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
            ],
          ),
        ],
      ),
    );
  }
}
