import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/providers/locale_provider.dart';
import 'package:provider_search/core/errors/app_exception.dart';
import 'package:provider_search/core/offline/offline_simulator.dart';
import 'package:provider_search/core/providers/offline_simulator_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/features/provider/list/providers/list_stale_data_provider.dart';
import 'package:provider_search/features/provider/list/providers/provider_list_notifier.dart';

void main() {
  group('ProviderListNotifier', () {
    late MockOfflineSimulator offlineSimulator;

    ProviderContainer createContainer() {
      offlineSimulator = MockOfflineSimulator(isOnline: true);
      return ProviderContainer(
        overrides: [
          appLocaleProvider.overrideWith((ref) => const Locale('en')),
          offlineSimulatorProvider.overrideWithValue(offlineSimulator),
          providerRepositoryProvider.overrideWith(
            (ref) => MockProviderRepository(
              offlineSimulator: ref.watch(offlineSimulatorProvider),
              loadingDelay: Duration.zero,
            ),
          ),
        ],
      );
    }

    test('loads providers on build', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final async = await container.read(providerListNotifierProvider.future);

      expect(async.length, 30);
    });

    test('reloads localized data when locale changes', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(providerListNotifierProvider.future);
      final enName =
          container.read(providerListNotifierProvider).value!.first.name;

      container.read(appLocaleProvider.notifier).state = const Locale('tr');
      await container
          .read(providerListNotifierProvider.notifier)
          .refresh();
      final trName =
          container.read(providerListNotifierProvider).value!.first.name;

      expect(enName, isNot(equals(trName)));
    });

    test('refresh keeps stale data when offline after success', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(providerListNotifierProvider.future);
      final cached = container.read(providerListNotifierProvider).value!;

      offlineSimulator.isOnline = false;
      await container.read(providerListNotifierProvider.notifier).refresh();

      expect(container.read(providerListNotifierProvider).value, cached);
      expect(container.read(listStaleDataProvider), isTrue);
    });

    test('refresh surfaces error when offline on first load', () async {
      offlineSimulator = MockOfflineSimulator(isOnline: false);
      final container = ProviderContainer(
        overrides: [
          appLocaleProvider.overrideWith((ref) => const Locale('en')),
          offlineSimulatorProvider.overrideWithValue(offlineSimulator),
          providerRepositoryProvider.overrideWith(
            (ref) => MockProviderRepository(
              offlineSimulator: ref.watch(offlineSimulatorProvider),
              loadingDelay: Duration.zero,
            ),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(providerListNotifierProvider.future),
        throwsA(isA<OfflineException>()),
      );
    });
  });
}
