import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:space_x_launches/presentation/launch_card.dart';

void main() {
  testWidgets(
      'LaunchCardWidget displays correct data', (WidgetTester tester) async {
    const date = '2023-05-17';
    const time = '09:00 AM';
    const missionName = 'Mission Name';
    const launchSiteName = 'Launch Site Name';
    const wikiPage = 'https://spacex.com';

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LaunchCardWidget(
            date: date,
            time: time,
            missionName: missionName,
            launchSiteName: launchSiteName,
            wikiPage: wikiPage,
          ),
        ),
      ),
    );

    final dateTextFinder = find.text(date);
    final timeTextFinder = find.text(time);
    final missionNameTextFinder = find.text(missionName);
    final launchSiteNameTextFinder = find.text(launchSiteName);

    expect(dateTextFinder, findsOneWidget);
    expect(timeTextFinder, findsOneWidget);
    expect(missionNameTextFinder, findsOneWidget);
    expect(launchSiteNameTextFinder, findsOneWidget);
  });
}
