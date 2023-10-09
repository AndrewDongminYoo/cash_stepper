// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'm_y_budgets_model.dart';

export 'm_y_budgets_model.dart';

class MYBudgetsWidget extends StatefulWidget {
  const MYBudgetsWidget({Key? key}) : super(key: key);

  @override
  State<MYBudgetsWidget> createState() => _MYBudgetsWidgetState();
}

class _MYBudgetsWidgetState extends State<MYBudgetsWidget>
    with TickerProviderStateMixin {
  late MYBudgetsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: const Offset(0, 49),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 200.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 200.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 200.ms,
          begin: const Offset(0, 51),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 200.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'listViewOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 150.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 150.ms,
          begin: const Offset(0, 26),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 90.ms,
          duration: 150.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, MYBudgetsModel.new);

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
      backgroundColor: CustomTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.pushNamed(
            'createBudget',
            extra: <String, dynamic>{
              kTransitionInfoKey: const TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.bottomToTop,
                duration: Duration(milliseconds: 220),
              ),
            },
          );
        },
        backgroundColor: CustomTheme.of(context).tertiary,
        elevation: 8,
        child: Icon(
          Icons.post_add_rounded,
          color: CustomTheme.of(context).textColor,
          size: 32,
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'My Budget',
          style: CustomTheme.of(context).displaySmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          height: 140,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x3F14181B),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 12, 12, 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  textAlign: TextAlign.start,
                                  style: CustomTheme.of(context).bodySmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Text(
                                    r'+$12,402',
                                    textAlign: TextAlign.start,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: CustomTheme.of(context)
                                              .tertiary,
                                          fontSize: 32,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0x4D39D2C0),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5% ',
                                        textAlign: TextAlign.start,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  CustomTheme.of(context)
                                                      .tertiary,
                                            ),
                                      ),
                                      Icon(
                                        Icons.trending_up_rounded,
                                        color: CustomTheme.of(context)
                                            .tertiary,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation1']!),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.44,
                          height: 140,
                          decoration: BoxDecoration(
                            color: CustomTheme.of(context)
                                .secondaryBackground,
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x3F14181B),
                                offset: Offset(0, 3),
                              )
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12, 12, 12, 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Spending',
                                  textAlign: TextAlign.start,
                                  style: CustomTheme.of(context).bodySmall,
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 8, 0, 12),
                                  child: Text(
                                    r'-$8,392',
                                    textAlign: TextAlign.start,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color: CustomTheme.of(context)
                                              .errorRed,
                                          fontSize: 32,
                                        ),
                                  ),
                                ),
                                Container(
                                  width: 80,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0x9AF06A6A),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '4.5% ',
                                        textAlign: TextAlign.start,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  CustomTheme.of(context)
                                                      .errorRed,
                                            ),
                                      ),
                                      Icon(
                                        Icons.trending_up_rounded,
                                        color: CustomTheme.of(context)
                                            .errorRed,
                                        size: 24,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation2']!),
                      ],
                    ),
                  ),
                  StreamBuilder<List<BudgetsRecord>>(
                    stream: queryBudgetsRecord(
                      queryBuilder: (budgetsRecord) => budgetsRecord.where(
                        'userBudgets',
                        isEqualTo: currentUserReference,
                      ),
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
                      final listViewBudgetsRecordList = snapshot.data!;
                      if (listViewBudgetsRecordList.isEmpty) {
                        return Center(
                          child: Image.asset(
                            'assets/images/emptyBudgets@2x.png',
                            width: MediaQuery.sizeOf(context).width * 0.8,
                            height: 400,
                          ),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: listViewBudgetsRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewBudgetsRecord =
                              listViewBudgetsRecordList[listViewIndex];
                          return Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 12),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await context.pushNamed(
                                  'budgetDetails',
                                  queryParameters: {
                                    'budgetDetails': serializeParam(
                                      listViewBudgetsRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: CustomTheme.of(context).primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      12, 12, 12, 12),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 0, 4),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              listViewBudgetsRecord.budgetName,
                                              style:
                                                  CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            CustomTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color:
                                                  CustomTheme.of(context)
                                                      .textColor,
                                              size: 16,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        formatNumber(
                                          listViewBudgetsRecord
                                              .budgetAmountNumber,
                                          formatType: FormatType.decimal,
                                          decimalType: DecimalType.automatic,
                                          currency: r'$',
                                        ),
                                        style: CustomTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Lexend',
                                              color:
                                                  CustomTheme.of(context)
                                                      .textColor,
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 4, 0, 0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                listViewBudgetsRecord
                                                    .budgetTime,
                                                '4 Days Left',
                                              ),
                                              style:
                                                  CustomTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            CustomTheme.of(
                                                                    context)
                                                                .alternate,
                                                      ),
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 0, 4, 0),
                                                  child: Text(
                                                    'Total Spent',
                                                    textAlign: TextAlign.end,
                                                    style: CustomTheme.of(
                                                            context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Lexend',
                                                          color: const Color(
                                                              0xB3FFFFFF),
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    formatNumber(
                                                      listViewBudgetsRecord
                                                          .budgetSpentNumber,
                                                      formatType:
                                                          FormatType.decimal,
                                                      decimalType: DecimalType
                                                          .periodDecimal,
                                                      currency: '',
                                                    ),
                                                    r'$22,000',
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: CustomTheme.of(
                                                          context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color:
                                                            CustomTheme.of(
                                                                    context)
                                                                .textColor,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ).animateOnPageLoad(
                          animationsMap['listViewOnPageLoadAnimation']!);
                    },
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
