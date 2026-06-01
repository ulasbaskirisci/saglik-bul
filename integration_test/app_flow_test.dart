import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_search/core/network/connectivity_service.dart';
import 'package:provider_search/core/providers/connectivity_provider.dart';
import 'package:provider_search/core/providers/locale_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('list → filter → detail flow', (tester) async {
    final connectivity = MockConnectivityService(online: true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appLocaleProvider.overrideWith((ref) => const Locale('en')),
          connectivityServiceProvider.overrideWithValue(connectivity),
          providerRepositoryProvider.overrideWith(
            (ref) => MockProviderRepository(
              connectivity: connectivity,
              loadingDelay: Duration.zero,
            ),
          ),
        ],
        child: const ProviderSearchApp(),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));

    // SliverAppBar.large may render the title more than once while expanded.
    expect(find.text('Providers'), findsWidgets);
    expect(find.text('Ankara Memorial Hospital'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.filter_list));
    await tester.pumpAndSettle();

    expect(find.text('Filters'), findsOneWidget);
    await tester.tap(find.textContaining('results'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Ankara Memorial Hospital'));
    await tester.pumpAndSettle();

    expect(find.byType(BackButton), findsOneWidget);
    expect(find.text('Ankara Memorial Hospital'), findsWidgets);
  });
}
