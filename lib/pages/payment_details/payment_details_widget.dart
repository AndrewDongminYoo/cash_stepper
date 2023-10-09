// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/backend/backend.dart';
import '/base/custom_icon_button.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import 'payment_details_model.dart';

export 'payment_details_model.dart';

class PaymentDetailsWidget extends StatefulWidget {
  const PaymentDetailsWidget({
    Key? key,
    this.transactionDetails,
    this.userSpent,
  }) : super(key: key);

  final DocumentReference? transactionDetails;
  final DocumentReference? userSpent;

  @override
  State<PaymentDetailsWidget> createState() => _PaymentDetailsWidgetState();
}

class _PaymentDetailsWidgetState extends State<PaymentDetailsWidget> {
  late PaymentDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, PaymentDetailsModel.new);
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TransactionsRecord>(
      stream: TransactionsRecord.getDocument(widget.transactionDetails!),
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
        final paymentDetailsTransactionsRecord = snapshot.data!;
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
            title: Text(
              'Details',
              style: CustomTheme.of(context).titleSmall,
            ),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                child: CustomIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  buttonSize: 46,
                  icon: Icon(
                    Icons.edit_outlined,
                    color: CustomTheme.of(context).textColor,
                    size: 24,
                  ),
                  onPressed: () async {
                    await context.pushNamed(
                      'transaction_EDIT',
                      queryParameters: {
                        'transactionDetails': serializeParam(
                          paymentDetailsTransactionsRecord.reference,
                          ParamType.DocumentReference,
                        ),
                      }.withoutNulls,
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: CustomTheme.of(context).primary,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Amount',
                                style: CustomTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: CustomTheme.of(context).textColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                '\$${paymentDetailsTransactionsRecord.transactionAmount}',
                                style: CustomTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Lexend',
                                      color: CustomTheme.of(context).textColor,
                                      fontSize: 36,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Vendor',
                          style: CustomTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          paymentDetailsTransactionsRecord.transactionName,
                          style: CustomTheme.of(context).headlineSmall.override(
                                fontFamily: 'Lexend',
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'When',
                          style: CustomTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    children: [
                      Text(
                        dateTimeFormat(
                          'MMMEd',
                          paymentDetailsTransactionsRecord.transactionTime,
                          locale: GetLocalizations.of(context).languageCode,
                        ),
                        style: CustomTheme.of(context).bodySmall,
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                        child: Text(
                          dateTimeFormat(
                            'jm',
                            paymentDetailsTransactionsRecord.transactionTime,
                            locale: GetLocalizations.of(context).languageCode,
                          ),
                          style: CustomTheme.of(context).bodySmall.override(
                                fontFamily: 'Lexend',
                                color: CustomTheme.of(context).tertiary,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                          child: Text(
                            'Reason',
                            style: CustomTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          paymentDetailsTransactionsRecord.transactionReason,
                          style: CustomTheme.of(context).bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Spent by',
                          style: CustomTheme.of(context).bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                  child: Row(
                    children: [
                      StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(widget.userSpent!),
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
                          final containerUsersRecord = snapshot.data!;
                          return Material(
                            color: Colors.transparent,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              height: 60,
                              decoration: BoxDecoration(
                                color:
                                    CustomTheme.of(context).secondaryBackground,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Row(
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: CustomTheme.of(context).primary,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(2, 2, 2, 2),
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: CachedNetworkImage(
                                            fadeOutDuration: const Duration(
                                                milliseconds: 500),
                                            imageUrl: valueOrDefault<String>(
                                              containerUsersRecord.photoUrl,
                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/sample-app-e-comm-3oxq8y/assets/hszmaloprc7a/Mia%20Deaven.jpg',
                                            ),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              12, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                containerUsersRecord
                                                    .displayName,
                                                style: CustomTheme.of(context)
                                                    .headlineSmall,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            containerUsersRecord.email,
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lexend',
                                                  color: CustomTheme.of(context)
                                                      .primary,
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
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
