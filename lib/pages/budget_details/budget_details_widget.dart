// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/backend/backend.dart';
import '/base/custom_charts.dart';
import '/base/custom_icon_button.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import 'budget_details_model.dart';

export 'budget_details_model.dart';

class BudgetDetailsWidget extends StatefulWidget {
  const BudgetDetailsWidget({
    Key? key,
    this.budgetDetails,
  }) : super(key: key);

  final DocumentReference? budgetDetails;

  @override
  State<BudgetDetailsWidget> createState() => _BudgetDetailsWidgetState();
}

class _BudgetDetailsWidgetState extends State<BudgetDetailsWidget> {
  late BudgetDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, BudgetDetailsModel.new);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BudgetsRecord>(
      stream: BudgetsRecord.getDocument(widget.budgetDetails!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: CustomTheme.of(context).primaryBackground,
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
        final budgetDetailsBudgetsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: CustomTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: CustomTheme.of(context).primary,
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
                color: CustomTheme.of(context).textColor,
                size: 32,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: CustomIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  buttonSize: 48,
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: CustomTheme.of(context).textColor,
                    size: 30,
                  ),
                  onPressed: () async {
                    await context.pushNamed(
                      'budget_DELETE',
                      queryParameters: {
                        'budgetList': serializeParam(
                          budgetDetailsBudgetsRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: const TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 220),
                        ),
                      },
                    );
                  },
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).primary,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x3F14181B),
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    budgetDetailsBudgetsRecord.budgetName,
                                    style: CustomTheme.of(context)
                                        .displaySmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color:
                                              CustomTheme.of(context).textColor,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 0, 20, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 0),
                                child: Text(
                                  formatNumber(
                                    budgetDetailsBudgetsRecord
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
                                            CustomTheme.of(context).textColor,
                                        fontSize: 36,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8, 0, 0, 4),
                                child: Text(
                                  'Per Month',
                                  style: CustomTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend',
                                        color: const Color(0xB3FFFFFF),
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20, 8, 20, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  budgetDetailsBudgetsRecord.budgetTime,
                                  '4 Days Left',
                                ),
                                style: CustomTheme.of(context).titleSmall,
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 4, 0),
                                    child: Text(
                                      'Total Spent',
                                      textAlign: TextAlign.end,
                                      style: CustomTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Lexend',
                                            color: const Color(0xB3FFFFFF),
                                            fontWeight: FontWeight.w300,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    valueOrDefault<String>(
                                      formatNumber(
                                        budgetDetailsBudgetsRecord
                                            .budgetSpentNumber,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: r'$',
                                      ),
                                      '2,502',
                                    ),
                                    textAlign: TextAlign.end,
                                    style: CustomTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Lexend',
                                          color:
                                              CustomTheme.of(context).textColor,
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
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).primary,
                  ),
                  child: StreamBuilder<List<TransactionsRecord>>(
                    stream: queryTransactionsRecord(
                      queryBuilder: (transactionsRecord) =>
                          transactionsRecord.where(
                        'budgetAssociated',
                        isEqualTo: budgetDetailsBudgetsRecord.reference,
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
                      final chartTransactionsRecordList = snapshot.data!;
                      return SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: CustomLineChart(
                          data: [
                            GetLineChartData(
                              xData: chartTransactionsRecordList,
                              yData: chartTransactionsRecordList,
                              settings: LineChartBarData(
                                color: const Color(0xFF39D2C0),
                                isCurved: true,
                                preventCurveOverShooting: true,
                                dotData: const FlDotData(show: false),
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: const Color(0x6639D2C0),
                                ),
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            tooltipBackgroundColor:
                                CustomTheme.of(context).alternate,
                            backgroundColor: CustomTheme.of(context).primary,
                            showBorder: false,
                          ),
                          axisBounds: const AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle:
                                CustomTheme.of(context).bodyMedium.override(
                                      fontFamily: 'Lexend',
                                      fontSize: 12,
                                    ),
                            labelInterval: 10,
                          ),
                          yAxisLabelInfo: AxisLabelInfo(
                            showLabels: true,
                            labelTextStyle: CustomTheme.of(context).bodyMedium,
                            labelInterval: 10,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 12, 0, 0),
                              child: Text(
                                'Transactions',
                                style: CustomTheme.of(context).bodyMedium,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 24),
                      child: StreamBuilder<List<TransactionsRecord>>(
                        stream: queryTransactionsRecord(
                          queryBuilder: (transactionsRecord) =>
                              transactionsRecord
                                  .where(
                                    'budgetAssociated',
                                    isEqualTo:
                                        budgetDetailsBudgetsRecord.reference,
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
                                width: 200,
                                height: 400,
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
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x3F14181B),
                                          offset: Offset(0, 3),
                                        )
                                      ],
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
                                                Expanded(
                                                  child: Text(
                                                    transactionListTransactionsRecord
                                                        .transactionName,
                                                    style:
                                                        CustomTheme.of(context)
                                                            .headlineSmall,
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
                                                    'MMMEd',
                                                    transactionListTransactionsRecord
                                                        .transactionTime,
                                                    locale: GetLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  textAlign: TextAlign.end,
                                                  style: CustomTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lexend',
                                                        fontSize: 12,
                                                      ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
