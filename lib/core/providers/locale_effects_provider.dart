import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/filter_state.dart';
import '../../features/provider/detail/providers/provider_detail_provider.dart';
import '../../features/provider/filter/providers/filter_state_provider.dart';
import '../../features/provider/list/providers/provider_list_notifier.dart';
import '../../features/provider/list/providers/search_query_provider.dart';
import 'locale_provider.dart';

/// Keeps mock provider data in sync when [appLocaleProvider] changes.
final localeChangeEffectsProvider = Provider<void>((ref) {
  ref.listen<Locale>(appLocaleProvider, (previous, next) {
    if (previous == null || previous == next) return;

    ref.read(filterStateProvider.notifier).state = const FilterState();
    ref.read(searchQueryProvider.notifier).state = '';
    ref.read(providerListNotifierProvider.notifier).refresh();
    ref.invalidate(providerDetailProvider);
  });
});
