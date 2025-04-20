import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pulseboard/utility/router.dart';

void main() {
  testWidgets('Switch between temperature and humidity in Settings', (
    WidgetTester tester,
  ) async {
    final _appRouter = AppRouter();

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(routerConfig: _appRouter.config()),
      ),
    );
    await tester.pumpAndSettle();

    final settingsIconFinder = find.byIcon(Icons.settings);
    expect(settingsIconFinder, findsOneWidget);
    await tester.tap(settingsIconFinder);
    await tester.pumpAndSettle();

    final tempButtonFinder = find.text('Temperature');
    final humidityButtonFinder = find.text('Humidity');

    expect(tempButtonFinder, findsOneWidget);
    expect(humidityButtonFinder, findsOneWidget);

    await tester.tap(humidityButtonFinder);
    await tester.pumpAndSettle();

    tester.state<NavigatorState>(find.byType(Navigator)).pop();
    await tester.pumpAndSettle();

    expect(find.text('Humidity (%)'), findsOneWidget);
  });
}