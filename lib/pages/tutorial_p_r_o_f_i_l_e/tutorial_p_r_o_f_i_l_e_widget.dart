// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import 'tutorial_p_r_o_f_i_l_e_model.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
export 'tutorial_p_r_o_f_i_l_e_model.dart';

class TutorialPROFILEWidget extends StatefulWidget {
  const TutorialPROFILEWidget({Key? key}) : super(key: key);

  @override
  State<TutorialPROFILEWidget> createState() => _TutorialPROFILEWidgetState();
}

class _TutorialPROFILEWidgetState extends State<TutorialPROFILEWidget> {
  late TutorialPROFILEModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, TutorialPROFILEModel.new);
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
          'Tutorial',
          style: CustomTheme.of(context).headlineSmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
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
                    height: MediaQuery.sizeOf(context).height * 0.6,
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
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
          ],
        ),
      ),
    );
  }
}
