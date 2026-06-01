import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/locale_provider.dart';
import '../../../../core/providers/repository_provider.dart';
import '../../../../data/models/provider_profile.dart';
import 'list_stale_data_provider.dart';

class ProviderListNotifier extends AsyncNotifier<List<ProviderProfile>> {
  @override
  Future<List<ProviderProfile>> build() async {
    final locale = ref.watch(appLocaleProvider);
    ref.read(listStaleDataProvider.notifier).state = false;
    final repository = ref.watch(providerRepositoryProvider);
    return repository.fetchProviders(locale: locale);
  }

  Future<void> refresh() async {
    final locale = ref.read(appLocaleProvider);
    final previous = state.valueOrNull;
    ref.read(listStaleDataProvider.notifier).state = false;

    state = const AsyncValue<List<ProviderProfile>>.loading()
        .copyWithPrevious(state, isRefresh: true);

    state = await AsyncValue.guard(() async {
      final repository = ref.read(providerRepositoryProvider);
      return repository.fetchProviders(locale: locale);
    });

    if (state.hasError && previous != null) {
      ref.read(listStaleDataProvider.notifier).state = true;
      state = AsyncValue.data(previous);
    }
  }
}

final providerListNotifierProvider =
    AsyncNotifierProvider<ProviderListNotifier, List<ProviderProfile>>(
  ProviderListNotifier.new,
);
