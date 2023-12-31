// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// 🌎 Project imports:
import '/auth/firebase_auth/auth_util.dart';
import '/auth/firebase_auth/firebase_user_provider.dart';
import '/base/custom_theme.dart';
import '/base/custom_util.dart';
import '/base/internationalization.dart';
import '/pages/pages.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = CustomTheme.themeMode;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = cashStepperFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        CustomTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'cashstepper',
      localizationsDelegates: const [
        GetLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('de'),
        Locale('ar'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: const ScrollbarThemeData(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: const ScrollbarThemeData(),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'MY_Card';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'MY_Card': const MYCardWidget(),
      'MY_Budgets': const MYBudgetsWidget(),
      'MY_profilePage': const MYProfilePageWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: CustomTheme.of(context).darkBackground,
        selectedItemColor: CustomTheme.of(context).primary,
        unselectedItemColor: CustomTheme.of(context).grayLight,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.credit_card,
              size: 24,
            ),
            activeIcon: FaIcon(
              FontAwesomeIcons.solidCreditCard,
              size: 20,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.stacked_line_chart_rounded,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.stacked_line_chart_rounded,
              size: 24,
            ),
            label: '•',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle_outlined,
              size: 24,
            ),
            activeIcon: Icon(
              Icons.account_circle_rounded,
              size: 24,
            ),
            label: '•',
            tooltip: '',
          )
        ],
      ),
    );
  }
}
