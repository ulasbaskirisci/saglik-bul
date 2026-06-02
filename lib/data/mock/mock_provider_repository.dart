import 'package:flutter/material.dart';

import '../../core/errors/app_exception.dart';
import '../../core/offline/offline_simulator.dart';
import '../models/provider_profile.dart';
import '../repositories/provider_repository.dart';
import 'mock_provider_localizer.dart';

class MockProviderRepository implements ProviderRepository {
  MockProviderRepository({
    required OfflineSimulator offlineSimulator,
    this.loadingDelay = const Duration(milliseconds: 800),
    this.simulateInitialError = false,
  }) : _offlineSimulator = offlineSimulator;

  final OfflineSimulator _offlineSimulator;
  final Duration loadingDelay;
  final bool simulateInitialError;

  bool _initialErrorConsumed = false;
  List<ProviderProfile>? _memoryCache;
  String? _cachedLanguageCode;

  @override
  Future<List<ProviderProfile>> fetchProviders({required Locale locale}) async {
    await _ensureAvailable();
    final switchingLanguage = _cachedLanguageCode != null &&
        _cachedLanguageCode != locale.languageCode;
    await Future<void>.delayed(
      switchingLanguage ? const Duration(milliseconds: 200) : loadingDelay,
    );

    if (simulateInitialError && !_initialErrorConsumed) {
      _initialErrorConsumed = true;
      throw const LoadFailedException();
    }

    final result = List<ProviderProfile>.unmodifiable(
      resolveMockProviders(locale),
    );
    _memoryCache = result;
    _cachedLanguageCode = locale.languageCode;
    return result;
  }

  @override
  Future<ProviderProfile?> getProviderById(
    String id, {
    required Locale locale,
  }) async {
    if (_cachedLanguageCode == locale.languageCode) {
      final cached = _findInCache(id);
      if (cached != null) return cached;
    }

    await _ensureAvailable();
    await Future<void>.delayed(const Duration(milliseconds: 200));

    try {
      return resolveMockProviders(locale).firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  ProviderProfile? _findInCache(String id) {
    final cache = _memoryCache;
    if (cache == null) return null;
    for (final profile in cache) {
      if (profile.id == id) return profile;
    }
    return null;
  }

  Future<void> _ensureAvailable() async {
    if (!await _offlineSimulator.isAvailable) {
      throw const OfflineException();
    }
  }
}
