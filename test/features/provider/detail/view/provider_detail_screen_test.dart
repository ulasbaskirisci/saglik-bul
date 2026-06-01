import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/providers/locale_provider.dart';
import 'package:provider_search/data/models/provider_profile.dart';
import 'package:provider_search/features/provider/detail/providers/provider_detail_provider.dart';
import 'package:provider_search/features/provider/detail/view/provider_detail_screen.dart';
import 'package:provider_search/l10n/app_localizations.dart';

void main() {
  Future<void> pumpDetail(
    WidgetTester tester,
    Widget widget,
  ) async {
    await tester.binding.setSurfaceSize(const Size(430, 932));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
  }

  Widget buildScreen({
    required String providerId,
    required ProviderProfile? profile,
  }) {
    final container = ProviderContainer(
      overrides: [
        appLocaleProvider.overrideWith((ref) => const Locale('en')),
        providerDetailProvider.overrideWith(
          () => _FixedDetailNotifier(profile),
        ),
      ],
    );

    return UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: ProviderDetailScreen(providerId: providerId),
      ),
    );
  }

  group('ProviderDetailScreen', () {
    testWidgets('shows contact unavailable when phone and email are null',
        (tester) async {
      const profile = ProviderProfile(
        id: 'no-contact',
        name: 'No Contact Clinic',
        category: 'Healthcare',
        country: 'Turkey',
        city: 'Ankara',
        rating: 4.0,
        phone: null,
        email: null,
        description: 'No direct contact on file.',
      );

      await pumpDetail(
        tester,
        buildScreen(providerId: 'no-contact', profile: profile),
      );

      expect(find.text('No Contact Clinic'), findsWidgets);
      expect(find.text('Contact information not available'), findsOneWidget);
      expect(find.text('Call'), findsNothing);
      expect(find.text('Send email'), findsNothing);
    });

    testWidgets('shows tappable phone and email when present', (tester) async {
      const profile = ProviderProfile(
        id: 'with-contact',
        name: 'Contact Clinic',
        category: 'Healthcare',
        country: 'Turkey',
        city: 'Istanbul',
        rating: 4.7,
        phone: '+90 212 555 0101',
        email: 'hello@clinic.example',
        description: 'Full contact details.',
      );

      await pumpDetail(
        tester,
        buildScreen(providerId: 'with-contact', profile: profile),
      );

      expect(find.text('+90 212 555 0101'), findsOneWidget);
      expect(find.text('hello@clinic.example'), findsOneWidget);
      expect(find.text('Call'), findsOneWidget);
      expect(find.text('Send email'), findsOneWidget);
    });

    testWidgets('shows not found when provider is null', (tester) async {
      await pumpDetail(
        tester,
        buildScreen(providerId: 'missing', profile: null),
      );

      expect(find.text('Provider not found'), findsOneWidget);
    });
  });
}

class _FixedDetailNotifier extends ProviderDetailNotifier {
  _FixedDetailNotifier(this._profile);

  final ProviderProfile? _profile;

  @override
  Future<ProviderProfile?> build(String arg) async => _profile;
}
