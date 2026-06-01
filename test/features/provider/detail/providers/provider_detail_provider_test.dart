import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/network/connectivity_service.dart';
import 'package:provider_search/core/providers/connectivity_provider.dart';
import 'package:provider_search/core/providers/locale_provider.dart';
import 'package:provider_search/core/providers/repository_provider.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';
import 'package:provider_search/features/provider/detail/providers/provider_detail_provider.dart';
import 'package:provider_search/features/provider/list/providers/provider_list_notifier.dart';

void main() {
  group('providerDetailProvider', () {
    late MockConnectivityService connectivity;

    ProviderContainer createContainer() {
      connectivity = MockConnectivityService(online: true);
      return ProviderContainer(
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
      );
    }

    test('returns profile from list cache when already loaded', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final list = await container.read(providerListNotifierProvider.future);
      final detail =
          await container.read(providerDetailProvider(list.first.id).future);

      expect(detail?.id, list.first.id);
      expect(detail?.name, list.first.name);
    });

    test('returns null when id is unknown', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(providerListNotifierProvider.future);
      final detail =
          await container.read(providerDetailProvider('unknown-id').future);

      expect(detail, isNull);
    });

    test('resolves localized profile after locale change', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final list = await container.read(providerListNotifierProvider.future);
      final id = list.first.id;

      final en = await container.read(providerDetailProvider(id).future);
      container.read(appLocaleProvider.notifier).state = const Locale('tr');
      await container.read(providerListNotifierProvider.notifier).refresh();
      final tr = await container.read(providerDetailProvider(id).future);

      expect(en?.name, isNot(equals(tr?.name)));
    });
  });
}
