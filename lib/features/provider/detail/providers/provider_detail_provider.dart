import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/locale_provider.dart';
import '../../../../core/providers/repository_provider.dart';
import '../../../../data/models/provider_profile.dart';
import '../../list/providers/provider_list_notifier.dart';

class ProviderDetailNotifier
    extends FamilyAsyncNotifier<ProviderProfile?, String> {
  @override
  Future<ProviderProfile?> build(String arg) async {
    final locale = ref.watch(appLocaleProvider);
    final fromList = ref.read(providerListNotifierProvider).valueOrNull;
    if (fromList != null) {
      for (final profile in fromList) {
        if (profile.id == arg) return profile;
      }
    }

    final repository = ref.watch(providerRepositoryProvider);
    return repository.getProviderById(arg, locale: locale);
  }

  Future<void> retry() async {
    final locale = ref.read(appLocaleProvider);
    state = const AsyncValue<ProviderProfile?>.loading();
    state = await AsyncValue.guard(() async {
      final fromList = ref.read(providerListNotifierProvider).valueOrNull;
      if (fromList != null) {
        for (final profile in fromList) {
          if (profile.id == arg) return profile;
        }
      }
      final repository = ref.read(providerRepositoryProvider);
      return repository.getProviderById(arg, locale: locale);
    });
  }
}

final providerDetailProvider = AsyncNotifierProvider.family<
    ProviderDetailNotifier, ProviderProfile?, String>(
  ProviderDetailNotifier.new,
);
