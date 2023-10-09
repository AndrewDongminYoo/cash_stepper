// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import 'onboarding_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key? key}) : super(key: key);

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, OnboardingModel.new);
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
      backgroundColor: CustomTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (Theme.of(context).brightness == Brightness.dark)
                    Image.asset(
                      'assets/images/finWallet_logo_landscape.png',
                      width: 170,
                      height: 60,
                      fit: BoxFit.fitWidth,
                    ),
                  if (!(Theme.of(context).brightness == Brightness.dark))
                    Image.asset(
                      'assets/images/finWallet_logo_landscapeDark@3x.png',
                      width: 170,
                      height: 60,
                      fit: BoxFit.fitWidth,
                    ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(),
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 20),
                                          child: Image.asset(
                                            'assets/images/fin_onboarding_1@2x.png',
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.7,
                                            height: 300,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Create Budgets',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .displaySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Create budgets that you can ti...',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 0, 0, 20),
                                          child: Image.asset(
                                            'assets/images/fin_onboarding_2@2x.png',
                                            width: 300,
                                            height: 300,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Keep Track of Spending',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .displaySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Easily add transactions and as...',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 30, 0, 30),
                                          child: Image.asset(
                                            'assets/images/fin_onboarding_3@2x.png',
                                            width: 300,
                                            height: 250,
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Budget Analysis',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .displaySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              20, 0, 20, 8),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Know where your budgets are an...',
                                              textAlign: TextAlign.center,
                                              style: CustomTheme.of(context)
                                                  .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 10),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(),
                              count: 3,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 2,
                                dotHeight: 4,
                                dotColor: const Color(0x8AC6CAD4),
                                activeDotColor:
                                    CustomTheme.of(context).primaryText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                    child: GetButtonWidget(
                      onPressed: () async {
                        await context.pushNamed(
                          'createBudgetBegin',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: const TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 220),
                            ),
                          },
                        );
                      },
                      text: 'Create Your Budget',
                      options: GetButtonOptions(
                        width: 200,
                        height: 50,
                        padding: EdgeInsetsDirectional.zero,
                        iconPadding: EdgeInsetsDirectional.zero,
                        color: CustomTheme.of(context).secondaryBackground,
                        textStyle: CustomTheme.of(context).titleSmall.override(
                              fontFamily: 'Lexend',
                              color: CustomTheme.of(context).primary,
                            ),
                        elevation: 2,
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
          ],
        ),
      ),
    );
  }
}
