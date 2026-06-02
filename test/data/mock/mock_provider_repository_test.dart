import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/errors/app_exception.dart';
import 'package:provider_search/core/offline/offline_simulator.dart';
import 'package:provider_search/data/mock/mock_provider_repository.dart';

void main() {
  group('MockProviderRepository', () {
    test('fetchProviders returns mock data when online', () async {
      final repository = MockProviderRepository(
        offlineSimulator: MockOfflineSimulator(isOnline: true),
        loadingDelay: Duration.zero,
      );

      final providers =
          await repository.fetchProviders(locale: const Locale('en'));

      expect(providers.length, 30);
    });

    test('returns Turkish names when locale is tr', () async {
      final repository = MockProviderRepository(
        offlineSimulator: MockOfflineSimulator(isOnline: true),
        loadingDelay: Duration.zero,
      );

      final en = await repository.fetchProviders(locale: const Locale('en'));
      final tr = await repository.fetchProviders(locale: const Locale('tr'));

      expect(en.first.name, isNot(equals(tr.first.name)));
      expect(tr.first.country, 'Türkiye');
    });

    test('fetchProviders throws OfflineException when offline', () async {
      final repository = MockProviderRepository(
        offlineSimulator: MockOfflineSimulator(isOnline: false),
        loadingDelay: Duration.zero,
      );

      expect(
        repository.fetchProviders(locale: const Locale('en')),
        throwsA(isA<OfflineException>()),
      );
    });

    test('simulateInitialError throws once then succeeds', () async {
      final repository = MockProviderRepository(
        offlineSimulator: MockOfflineSimulator(isOnline: true),
        loadingDelay: Duration.zero,
        simulateInitialError: true,
      );

      expect(
        repository.fetchProviders(locale: const Locale('en')),
        throwsA(isA<LoadFailedException>()),
      );

      final providers =
          await repository.fetchProviders(locale: const Locale('en'));
      expect(providers, isNotEmpty);
    });

    test('getProviderById reads from memory cache when list was fetched',
        () async {
      final offlineSimulator = MockOfflineSimulator(isOnline: true);
      final repository = MockProviderRepository(
        offlineSimulator: offlineSimulator,
        loadingDelay: Duration.zero,
      );

      final all = await repository.fetchProviders(locale: const Locale('en'));
      offlineSimulator.isOnline = false;

      final found = await repository.getProviderById(
        all.first.id,
        locale: const Locale('en'),
      );

      expect(found?.id, all.first.id);
    });

    test('getProviderById returns provider or null', () async {
      final repository = MockProviderRepository(
        offlineSimulator: MockOfflineSimulator(isOnline: true),
        loadingDelay: Duration.zero,
      );

      final all = await repository.fetchProviders(locale: const Locale('en'));
      final found = await repository.getProviderById(
        all.first.id,
        locale: const Locale('en'),
      );
      final missing = await repository.getProviderById(
        'unknown-id',
        locale: const Locale('en'),
      );

      expect(found?.id, all.first.id);
      expect(missing, isNull);
    });
  });
}
