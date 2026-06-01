import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/provider_profile.dart';
import '../../filter/providers/filter_state_provider.dart';
import 'provider_filter_logic.dart';
import 'provider_list_notifier.dart';
import 'search_query_provider.dart';

final filteredProvidersProvider = Provider<List<ProviderProfile>>((ref) {
  final listAsync = ref.watch(providerListNotifierProvider);
  final searchQuery = ref.watch(searchQueryProvider);
  final filters = ref.watch(filterStateProvider);

  final providers = listAsync.valueOrNull;
  if (providers == null) return const [];

  return applySearchAndFilters(
    providers: providers,
    searchQuery: searchQuery,
    filters: filters,
  );
});
