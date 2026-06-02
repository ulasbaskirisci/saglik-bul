import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_search/core/offline/offline_simulator.dart';
import 'package:provider_search/core/providers/offline_simulator_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/main.dart';

void main() {
  testWidgets('App smoke test', (tester) async {
    final offlineSimulator = MockOfflineSimulator(isOnline: true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          offlineSimulatorProvider.overrideWithValue(offlineSimulator),
          providerRepositoryProvider.overrideWith(
            (ref) => MockProviderRepository(
              offlineSimulator: offlineSimulator,
              loadingDelay: Duration.zero,
            ),
          ),
        ],
        child: const ProviderSearchApp(),
      ),
    );

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('Providers'), findsWidgets);
    expect(find.text('Ankara Memorial Hospital'), findsOneWidget);

    await tester.tap(find.text('TR'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('Ankara Memorial Hastanesi'), findsOneWidget);
    expect(find.text('Ankara Memorial Hospital'), findsNothing);
  });
}
