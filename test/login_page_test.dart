import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stepper/ui/login/login_page.dart';

void main() {
  Widget makeTestableWidget({Widget child}) => MaterialApp(home: child);

  testWidgets('button text change from next to sign in',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));

    expect(find.text("NEXT"), findsOneWidget);

    await tester.tap(find.text("NEXT"));
    await tester.pumpAndSettle();

    expect(find.text("SIGN IN"), findsOneWidget);
  });

  testWidgets('on button tap change sign in page', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));

    expect(find.text('Enter your email'), findsOneWidget);

    await tester.tap(find.text("NEXT"));
    await tester.pumpAndSettle();

    expect(find.text('Enter your password'), findsOneWidget);
  });

  testWidgets('button text change from next to sign up',
      (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: LoginPage()));

    expect(find.text("NEXT"), findsOneWidget);

    await tester.tap(find.text("SIGN UP"));
    await tester.pump();

    expect(find.text("SIGN UP"), findsOneWidget);
  });
}
