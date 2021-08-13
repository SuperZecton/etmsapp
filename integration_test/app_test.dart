// This is a basic Flutter integration test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
//import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ltcapp/features/registration/view/pages/SignupPage.dart';
import 'package:ltcapp/utils/individual_identity.dart';
import 'package:ltcapp/utils/database_linker.dart';

import 'package:ltcapp/main.dart' as app;

//void main() => run(mainApp);

DatabaseHandler mainHandle = new DatabaseHandler(dbName: "main_personnel.db");

void mainApp() {
  /*
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    app.main();

    // Trigger a frame.
    await tester.pumpAndSettle();

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
  */
  app.MyApp();
  mainHandle.databaseCreationOptimizer();
}
