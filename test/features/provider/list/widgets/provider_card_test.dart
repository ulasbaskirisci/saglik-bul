import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/data/models/provider_profile.dart';
import 'package:provider_search/features/provider/list/widgets/provider_card.dart';
import 'package:provider_search/l10n/app_localizations.dart';

void main() {
  const profile = ProviderProfile(
    id: 'test-1',
    name: 'Test Clinic',
    category: 'Healthcare',
    country: 'Turkey',
    city: 'Ankara',
    rating: 4.5,
    description: 'Test description',
  );

  Widget buildCard({VoidCallback? onTap}) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: ProviderCard(
          profile: profile,
          onTap: onTap ?? () {},
        ),
      ),
    );
  }

  testWidgets('ProviderCard displays name, category, city and rating',
      (tester) async {
    await tester.pumpWidget(buildCard());
    await tester.pumpAndSettle();

    expect(find.text('Test Clinic'), findsOneWidget);
    expect(find.text('Healthcare'), findsOneWidget);
    expect(find.text('Ankara, Turkey'), findsOneWidget);
    expect(find.text('4.5'), findsOneWidget);
  });

  testWidgets('ProviderCard triggers onTap when pressed', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      buildCard(onTap: () => tapped = true),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ProviderCard));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
