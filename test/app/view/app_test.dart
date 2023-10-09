// 📦 Package imports:
import 'package:flutter_test/flutter_test.dart';

// 🌎 Project imports:
import 'package:cash_stepper/app/app.dart';
import 'package:cash_stepper/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
