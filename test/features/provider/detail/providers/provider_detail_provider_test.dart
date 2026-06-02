import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/offline/offline_simulator.dart';
import 'package:provider_search/core/providers/offline_simulator_provider.dart';
import 'package:provider_search/core/providers/locale_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/features/provider/detail/providers/provider_detail_provider.dart';
import 'package:provider_search/features/provider/list/providers/provider_list_notifier.dart';

void main() {
  group('providerDetailProvider', () {
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

    test('returns profile from list cache when already loaded', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(providerListNotifierProvider.future);
      final listFirst =
          container.read(providerListNotifierProvider).value!.first;

      final detail = await container.read(
        providerDetailProvider(listFirst.id).future,
      );

      expect(detail?.id, listFirst.id);
      expect(detail?.name, listFirst.name);
    });

    test('returns null when id is unknown', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(providerListNotifierProvider.future);

      final detail = await container.read(
        providerDetailProvider('unknown-id').future,
      );

      expect(detail, isNull);
    });
  });
}
