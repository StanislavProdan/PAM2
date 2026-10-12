import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:pad2/main.dart';

void main() {
  testWidgets('home screen renders the learning dashboard', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Hi, Kristin'), findsOneWidget);
    expect(find.text('Learning Plan'), findsOneWidget);
    expect(find.text('Meetup'), findsOneWidget);
  });

  testWidgets('course overview renders the enrollment content', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: CourseOverviewPage()),
    );

    expect(find.text('Course Overview'), findsOneWidget);
    expect(find.text('React Front To back'), findsOneWidget);
    expect(find.text('Enroll Now'), findsOneWidget);
  });
}
