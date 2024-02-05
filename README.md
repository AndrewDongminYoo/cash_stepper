# 캐시 스테퍼

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

[Very Good CLI][very_good_cli_link]에 의해 생성됨 🤖

Very Good CLI에 의해 생성된 아주 좋은 프로젝트.

---

## 시작하기 🚀

이 프로젝트에는 3가지 플레이버가 포함되어 있습니다:

- development
- staging
- production

원하는 플레이버를 실행하려면 VSCode/Android Studio에서 실행 구성을 사용하거나 다음 명령을 사용하세요:

```sh
# 개발환경
flutter run --flavor development --target lib/main.dart

# 스테이징환경
flutter run --flavor staging --target lib/main_staging.dart

# 프로덕션
flutter run --flavor production --target lib/main_production.dart
```

_*캐시 스테퍼는 iOS, Android, 웹에서 작동합니다.*_

---

## 테스트 실행하기 🧪

모든 유닛 및 위젯 테스트를 실행하려면 다음 명령을 사용합니다:

```sh
flutter test --coverage --test-randomize-ordering-seed random
```

생성된 커버리지 보고서를 보려면 [lcov](https://github.com/linux-test-project/lcov)를 사용할 수 있습니다.

```sh
# 커버리지 보고서 생성
genhtml coverage/lcov.info -o coverage/

# 커버리지 보고서 열기
open coverage/index.html
```

---

## 번역 작업 🌐

이 프로젝트는 [flutter_localizations][flutter_localizations_link]를 사용하며, [Flutter의 공식 국제화 가이드][internationalization_link]를 따릅니다.

### Adding Strings

1. 현지화 가능한 새 문자열을 추가하려면 `lib/l10n/arb/app_en.arb`에서 `app_en.arb` 파일을 엽니다.

   ```json
   {
     "@@locale": "en",
     "counterAppBarTitle": "Counter",
     "@counterAppBarTitle": {
       "description": "Text shown in the AppBar of the Counter Page"
     }
   }
   ```

2. 그런 다음 새 키/값과 설명을 추가합니다.

   ```json
   {
     "@@locale": "en",
     "counterAppBarTitle": "Counter",
     "@counterAppBarTitle": {
       "description": "Text shown in the AppBar of the Counter Page"
     },
     "helloWorld": "Hello World",
     "@helloWorld": {
       "description": "Hello World Text"
     }
   }
   ```

3. 새 문자열 사용

   ```dart
   import 'package:cash_stepper/l10n/l10n.dart';

   @override
   Widget build(BuildContext context) {
     final l10n = context.l10n;
     return Text(l10n.helloWorld);
   }
   ```

### 지원 언어 추가하기

새 로캘을 포함하도록 `ios/Runner/Info.plist`의 `Info.plist`에 있는 `CFBundleLocalizations` 배열을 업데이트합니다.

```xml
    ...

    <key>CFBundleLocalizations</key>
    <array>
        <string>en</string>
        <string>ko</string>
    </array>
```

### 번역 파일 추가하기

1. 지원되는 각 로캘에 대해 `lib/l10n/arb`에 새 ARB 파일을 추가합니다.

   ```log
   ├── l10n
   │   ├── arb
   │   │   ├── app_en.arb
   │   │   └── app_ko.arb
   ```

2. 각 `.arb` 파일에 번역된 문자열을 추가합니다:

   `app_en.arb`

   ```json
   {
     "@@locale": "en",
     "counterAppBarTitle": "Counter",
     "@counterAppBarTitle": {
       "description": "Text shown in the AppBar of the Counter Page"
     }
   }
   ```

   `app_ko.arb`

   ```json
   {
     "@@locale": "ko",
     "counterAppBarTitle": "카운터",
     "@counterAppBarTitle": {
       "description": "카운터 페이지의 앱바에 표시되는 텍스트"
     }
   }
   ```

### 번역 생성하기

최신 번역 변경 사항을 사용하려면 번역을 생성해야 합니다:

1. 현재 프로젝트에 대한 현지화를 생성합니다:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

또는 `flutter run`을 실행하면 코드 생성이 자동으로 수행됩니다.

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
