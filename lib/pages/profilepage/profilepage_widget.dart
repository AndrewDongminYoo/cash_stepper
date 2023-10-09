// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

// 🌎 Project imports:
import '/base/custom_animations.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import 'profilepage_model.dart';

export 'profilepage_model.dart';

class ProfilepageWidget extends StatefulWidget {
  const ProfilepageWidget({Key? key}) : super(key: key);

  @override
  State<ProfilepageWidget> createState() => _ProfilepageWidgetState();
}

class _ProfilepageWidgetState extends State<ProfilepageWidget>
    with TickerProviderStateMixin {
  late ProfilepageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
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
          begin: const Offset(0, 60),
          end: Offset.zero,
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(0, 90),
          end: Offset.zero,
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 1000.ms,
          begin: const Offset(0, 90),
          end: Offset.zero,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, ProfilepageModel.new);

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
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Wallet Balance',
                      style: CustomTheme.of(context).titleMedium,
                    ),
                    Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: CustomTheme.of(context).primary,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                        child: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            'https://picsum.photos/seed/750/600',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$23,000',
                      style: CustomTheme.of(context).displaySmall.override(
                            fontFamily: 'Lexend',
                            fontSize: 36,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '3 currencies',
                      style: CustomTheme.of(context).bodyMedium.override(
                            fontFamily: 'Lexend',
                            color: CustomTheme.of(context).tertiary,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.24,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 12, 12, 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Icon(
                                    Icons.account_balance_outlined,
                                    color: CustomTheme.of(context).textColor,
                                    size: 36,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    'My Bank',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      'Lexend Deca',
                                      color: CustomTheme.of(context).textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 0, 4, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await context.pushNamed(
                              'transferFunds',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: const TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.bottomToTop,
                                  duration: Duration(milliseconds: 220),
                                ),
                              },
                            );
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.24,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).darkBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                    child: Icon(
                                      Icons.swap_horiz_outlined,
                                      color: CustomTheme.of(context).textColor,
                                      size: 36,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      'Transfer',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color:
                                            CustomTheme.of(context).textColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed('MY_Card');
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.24,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).darkBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 12, 12, 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 12),
                                    child: Icon(
                                      Icons.stacked_line_chart_rounded,
                                      color: CustomTheme.of(context).textColor,
                                      size: 36,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      'Activity',
                                      style: GoogleFonts.getFont(
                                        'Lexend Deca',
                                        color:
                                            CustomTheme.of(context).textColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomTheme.of(context).errorRed,
                        CustomTheme.of(context).primary
                      ],
                      stops: const [0.0, 1.0],
                      begin: AlignmentDirectional.topEnd,
                      end: AlignmentDirectional.bottomStart,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bitcoin',
                          style: CustomTheme.of(context).headlineSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 0),
                              child: Text(
                                r'$7,302',
                                style: CustomTheme.of(context).displaySmall,
                              ),
                            ),
                            Text(
                              '32% of portfolio',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Lexend',
                                        color: const Color(0x7DEEEEEE),
                                      ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: LinearPercentIndicator(
                                percent: 0.34,
                                width: MediaQuery.sizeOf(context).width * 0.87,
                                lineHeight: 20,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    CustomTheme.of(context).textColor,
                                backgroundColor: const Color(0x33F1F4F8),
                                center: Text(
                                  ' ',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: CustomTheme.of(context).primary,
                                      ),
                                ),
                                barRadius: const Radius.circular(40),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation1']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 12),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF4B39EF),
                        CustomTheme.of(context).primary
                      ],
                      stops: const [0.0, 1.0],
                      begin: AlignmentDirectional.topEnd,
                      end: AlignmentDirectional.bottomStart,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Solona',
                          style: CustomTheme.of(context).headlineSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 0),
                              child: Text(
                                r'$7,302',
                                style: CustomTheme.of(context).displaySmall,
                              ),
                            ),
                            Text(
                              '40% of portfolio',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Lexend',
                                        color: const Color(0x7DEEEEEE),
                                      ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: LinearPercentIndicator(
                                percent: 0.4,
                                width: MediaQuery.sizeOf(context).width * 0.87,
                                lineHeight: 20,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    CustomTheme.of(context).textColor,
                                backgroundColor: const Color(0x33F1F4F8),
                                center: Text(
                                  ' ',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: CustomTheme.of(context).primary,
                                      ),
                                ),
                                barRadius: const Radius.circular(40),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation2']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        CustomTheme.of(context).tertiary,
                        const Color(0xFFEE8B60)
                      ],
                      stops: const [0.0, 1.0],
                      begin: AlignmentDirectional.topEnd,
                      end: AlignmentDirectional.bottomStart,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dogecoin',
                          style: CustomTheme.of(context).headlineSmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 8, 0, 0),
                              child: Text(
                                r'$7,302',
                                style: CustomTheme.of(context).displaySmall,
                              ),
                            ),
                            Text(
                              '40% of portfolio',
                              style:
                                  CustomTheme.of(context).bodyMedium.override(
                                        fontFamily: 'Lexend',
                                        color: const Color(0x7DEEEEEE),
                                      ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: LinearPercentIndicator(
                                percent: 0.4,
                                width: MediaQuery.sizeOf(context).width * 0.87,
                                lineHeight: 20,
                                animation: true,
                                animateFromLastPercent: true,
                                progressColor:
                                    CustomTheme.of(context).textColor,
                                backgroundColor: const Color(0x33F1F4F8),
                                center: Text(
                                  ' ',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: CustomTheme.of(context).primary,
                                      ),
                                ),
                                barRadius: const Radius.circular(40),
                                padding: EdgeInsets.zero,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).animateOnPageLoad(
                    animationsMap['containerOnPageLoadAnimation3']!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
