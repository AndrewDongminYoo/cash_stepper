// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 🌎 Project imports:
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import 'pause_card_model.dart';

export 'pause_card_model.dart';

class PauseCardWidget extends StatefulWidget {
  const PauseCardWidget({Key? key}) : super(key: key);

  @override
  State<PauseCardWidget> createState() => _PauseCardWidgetState();
}

class _PauseCardWidgetState extends State<PauseCardWidget> {
  late PauseCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, PauseCardModel.new);
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: CustomTheme.of(context).darkBackground,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Pause Card',
                  style: CustomTheme.of(context).displaySmall,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Are you sure you want to pause...',
                      style: CustomTheme.of(context).bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GetButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: 'Nevermind',
                    options: GetButtonOptions(
                      width: 150,
                      height: 50,
                      padding: EdgeInsetsDirectional.zero,
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: CustomTheme.of(context).background,
                      textStyle: CustomTheme.of(context).bodySmall,
                      elevation: 2,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  GetButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: 'Yes, Pause',
                    options: GetButtonOptions(
                      width: 150,
                      height: 50,
                      padding: EdgeInsetsDirectional.zero,
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: CustomTheme.of(context).primary,
                      textStyle:
                          CustomTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: Colors.white,
                              ),
                      elevation: 2,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(12),
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
