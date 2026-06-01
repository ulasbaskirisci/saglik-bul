import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_search/core/network/connectivity_service.dart';
import 'package:provider_search/core/providers/connectivity_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/main.dart';

void main() {
  testWidgets('App smoke test', (tester) async {
    final connectivity = MockConnectivityService(online: true);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
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
