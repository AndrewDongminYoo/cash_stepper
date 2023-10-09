// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'transfer_complete_model.dart';

export 'transfer_complete_model.dart';

class TransferCompleteWidget extends StatefulWidget {
  const TransferCompleteWidget({Key? key}) : super(key: key);

  @override
  State<TransferCompleteWidget> createState() => _TransferCompleteWidgetState();
}

class _TransferCompleteWidgetState extends State<TransferCompleteWidget> {
  late TransferCompleteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, TransferCompleteModel.new);
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
      backgroundColor: CustomTheme.of(context).tertiary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/transferComplete@2x.png',
                  width: 250,
                  height: 250,
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: Text(
                'Transfer Complete',
                style: CustomTheme.of(context).displaySmall.override(
                      fontFamily: 'Lexend',
                      color: CustomTheme.of(context).textColor,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Great work, you successfully t...',
                      textAlign: TextAlign.center,
                      style: CustomTheme.of(context).bodySmall.override(
                            fontFamily: 'Lexend',
                            color: const Color(0xB3FFFFFF),
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
              child: GetButtonWidget(
                onPressed: () async {
                  await context.pushNamed(
                    'MY_Card',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: const TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 200),
                      ),
                    },
                  );
                },
                text: 'Okay',
                options: GetButtonOptions(
                  width: 130,
                  height: 50,
                  padding: EdgeInsetsDirectional.zero,
                  iconPadding: EdgeInsetsDirectional.zero,
                  color: CustomTheme.of(context).primary,
                  textStyle: CustomTheme.of(context).titleSmall.override(
                        fontFamily: 'Lexend',
                        color: Colors.white,
                      ),
                  elevation: 2,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
