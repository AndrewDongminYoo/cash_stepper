// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_spinkit/flutter_spinkit.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/custom_widgets.dart';
import 'notifications_settings_model.dart';

export 'notifications_settings_model.dart';

class NotificationsSettingsWidget extends StatefulWidget {
  const NotificationsSettingsWidget({Key? key}) : super(key: key);

  @override
  State<NotificationsSettingsWidget> createState() =>
      _NotificationsSettingsWidgetState();
}

class _NotificationsSettingsWidgetState
    extends State<NotificationsSettingsWidget> {
  late NotificationsSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, NotificationsSettingsModel.new);
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
          'Notifications',
          style: CustomTheme.of(context).headlineSmall,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Container(
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
        child: StreamBuilder<UsersRecord>(
          stream: UsersRecord.getDocument(currentUserReference!),
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
            // final columnUsersRecord = snapshot.data!;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Choose what notifcations you w...',
                          style: CustomTheme.of(context).bodySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: SwitchListTile.adaptive(
                    value: _model.switchListTileValue1 ??= true,
                    onChanged: (newValue) async {
                      setState(() => _model.switchListTileValue1 = newValue);
                    },
                    title: Text(
                      'Push Notifications',
                      style: CustomTheme.of(context).headlineSmall,
                    ),
                    subtitle: Text(
                      'Receive Push notifications fro...',
                      style: CustomTheme.of(context).bodySmall,
                    ),
                    tileColor: CustomTheme.of(context).secondaryBackground,
                    activeColor: CustomTheme.of(context).tertiary,
                    activeTrackColor: CustomTheme.of(context).primary,
                    dense: false,
                    controlAffinity: ListTileControlAffinity.trailing,
                    contentPadding:
                        const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                  ),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue2 ??= true,
                  onChanged: (newValue) async {
                    setState(() => _model.switchListTileValue2 = newValue);
                  },
                  title: Text(
                    'Email Notifications',
                    style: CustomTheme.of(context).headlineSmall,
                  ),
                  subtitle: Text(
                    'Receive email notifications fr...',
                    style: CustomTheme.of(context).bodySmall,
                  ),
                  tileColor: CustomTheme.of(context).secondaryBackground,
                  activeColor: CustomTheme.of(context).tertiary,
                  activeTrackColor: CustomTheme.of(context).primary,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                ),
                SwitchListTile.adaptive(
                  value: _model.switchListTileValue3 ??= true,
                  onChanged: (newValue) async {
                    setState(() => _model.switchListTileValue3 = newValue);
                  },
                  title: Text(
                    'Location Services',
                    style: CustomTheme.of(context).headlineSmall,
                  ),
                  subtitle: Text(
                    'Allow us to track your locatio...',
                    style: CustomTheme.of(context).bodySmall,
                  ),
                  tileColor: CustomTheme.of(context).secondaryBackground,
                  activeColor: CustomTheme.of(context).tertiary,
                  activeTrackColor: CustomTheme.of(context).primary,
                  dense: false,
                  controlAffinity: ListTileControlAffinity.trailing,
                  contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: GetButtonWidget(
                    onPressed: () async {
                      context.pop();
                    },
                    text: 'Save Changes',
                    options: GetButtonOptions(
                      width: 190,
                      height: 50,
                      padding: EdgeInsetsDirectional.zero,
                      iconPadding: EdgeInsetsDirectional.zero,
                      color: CustomTheme.of(context).primary,
                      textStyle:
                          CustomTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend',
                                color: CustomTheme.of(context).textColor,
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
            );
          },
        ),
      ),
    );
  }
}
