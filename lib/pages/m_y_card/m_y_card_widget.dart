// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/base/custom_animations.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/components/pause_card/pause_card_widget.dart';
import 'm_y_card_model.dart';

export 'm_y_card_model.dart';

class MYCardWidget extends StatefulWidget {
  const MYCardWidget({Key? key}) : super(key: key);

  @override
  State<MYCardWidget> createState() => _MYCardWidgetState();
}

class _MYCardWidgetState extends State<MYCardWidget>
    with TickerProviderStateMixin {
  late MYCardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'rowOnPageLoadAnimation': AnimationInfo(
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
          begin: const Offset(0, 30),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(0.4, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
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
          begin: const Offset(0, 49),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
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
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(0, 51),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 50.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: 0,
          end: 1,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: const Offset(0, 69),
          end: Offset.zero,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 80.ms,
          duration: 600.ms,
          begin: const Offset(1, 0),
          end: const Offset(1, 1),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, MYCardModel.new);

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
            'transaction_ADD',
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
          Icons.add_rounded,
          color: CustomTheme.of(context).textColor,
          size: 36,
        ),
      ),
      appBar: AppBar(
        backgroundColor: CustomTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          'My Card',
          style: CustomTheme.of(context).displaySmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.92,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 6,
                            color: Color(0x4B1A1F24),
                            offset: Offset(0, 2),
                          )
                        ],
                        gradient: const LinearGradient(
                          colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.94, -1),
                          end: AlignmentDirectional(-0.94, 1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 20, 20, 0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/visa@3x.png',
                                  width: 44,
                                  height: 14,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 24, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Balance',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color:
                                            CustomTheme.of(context).textColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 8, 20, 0),
                            child: Row(
                              children: [
                                Text(
                                  r'$7,630',
                                  style: CustomTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Lexend',
                                        color:
                                            CustomTheme.of(context).textColor,
                                        fontSize: 32,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 12, 20, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '**** 0149',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        color:
                                            CustomTheme.of(context).textColor,
                                      ),
                                ),
                                Text(
                                  '05/25',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto Mono',
                                        color:
                                            CustomTheme.of(context).textColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.44,
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).secondaryBackground,
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
                                      color: CustomTheme.of(context).tertiary,
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
                                              CustomTheme.of(context).tertiary,
                                        ),
                                  ),
                                  Icon(
                                    Icons.trending_up_rounded,
                                    color: CustomTheme.of(context).tertiary,
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
                      decoration: BoxDecoration(
                        color: CustomTheme.of(context).secondaryBackground,
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
                                      color: CustomTheme.of(context).errorRed,
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
                                              CustomTheme.of(context).errorRed,
                                        ),
                                  ),
                                  Icon(
                                    Icons.trending_up_rounded,
                                    color: CustomTheme.of(context).errorRed,
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                decoration: BoxDecoration(
                  color: CustomTheme.of(context).secondaryBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                      child: Row(
                        children: [
                          Text(
                            'Quick Service',
                            style: CustomTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 100,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.swap_horiz_rounded,
                                    color: CustomTheme.of(context).primaryText,
                                    size: 40,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                    child: Text(
                                      'Transfer',
                                      style: CustomTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.44,
                            height: 100,
                            decoration: BoxDecoration(
                              color: CustomTheme.of(context).primaryBackground,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: const Color(0x00000000),
                                  barrierColor: const Color(0x00000000),
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const SizedBox(
                                        height: 220,
                                        child: PauseCardWidget(),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.pause_rounded,
                                    color: CustomTheme.of(context).primaryText,
                                    size: 40,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                    child: Text(
                                      'Pause Card',
                                      style: CustomTheme.of(context).bodyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                      child: Row(
                        children: [
                          Text(
                            'Transaction',
                            style: CustomTheme.of(context).bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                      child: StreamBuilder<List<TransactionsRecord>>(
                        stream: queryTransactionsRecord(
                          queryBuilder: (transactionsRecord) =>
                              transactionsRecord
                                  .where(
                                    'user',
                                    isEqualTo: currentUserReference,
                                  )
                                  .orderBy('transactionTime', descending: true),
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
                          final transactionListTransactionsRecordList =
                              snapshot.data!;
                          if (transactionListTransactionsRecordList.isEmpty) {
                            return Center(
                              child: Image.asset(
                                'assets/images/noTransactions.png',
                                width: 230,
                                height: 300,
                                fit: BoxFit.fitWidth,
                              ),
                            );
                          }
                          return Column(
                            children: List.generate(
                                transactionListTransactionsRecordList.length,
                                (transactionListIndex) {
                              final transactionListTransactionsRecord =
                                  transactionListTransactionsRecordList[
                                      transactionListIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 8),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await context.pushNamed(
                                      'paymentDetails',
                                      queryParameters: {
                                        'transactionDetails': serializeParam(
                                          transactionListTransactionsRecord
                                              .reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'userSpent': serializeParam(
                                          transactionListTransactionsRecord
                                              .user,
                                          ParamType.DocumentReference,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.92,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: CustomTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8, 0, 0, 0),
                                          child: Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: const Color(0x6639D2C0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                              child: Icon(
                                                Icons.monetization_on_rounded,
                                                color: CustomTheme.of(context)
                                                    .tertiary,
                                                size: 24,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(12, 0, 0, 0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  transactionListTransactionsRecord
                                                      .transactionName,
                                                  style: CustomTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        color: CustomTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                          .fromSTEB(0, 4, 0, 0),
                                                  child: Text(
                                                    'Income',
                                                    style:
                                                        CustomTheme.of(context)
                                                            .bodyMedium,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12, 0, 12, 0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                transactionListTransactionsRecord
                                                    .transactionAmount,
                                                textAlign: TextAlign.end,
                                                style: CustomTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Lexend',
                                                      color: CustomTheme.of(
                                                              context)
                                                          .tertiary,
                                                    ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 4, 0, 0),
                                                child: Text(
                                                  dateTimeFormat(
                                                    'relative',
                                                    transactionListTransactionsRecord
                                                        .transactionTime,
                                                    locale: GetLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium,
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
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation3']!),
            ],
          ),
        ),
      ),
    );
  }
}
