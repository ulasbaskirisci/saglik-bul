import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_error_view.dart';
import '../../../../data/models/filter_state.dart';
import '../../list/providers/filtered_providers_provider.dart';
import '../../list/providers/provider_list_notifier.dart';
import '../providers/filter_state_provider.dart';
import 'filter_form_list.dart';
import 'filter_form_skeleton.dart';
import 'filter_sheet_action_bar.dart';
import 'filter_sheet_header.dart';

class FilterSheetBody extends ConsumerWidget {
  const FilterSheetBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final listAsync = ref.watch(providerListNotifierProvider);
    final filters = ref.watch(filterStateProvider);
    final resultCount = ref.watch(filteredProvidersProvider).length;
    final cachedProviders = listAsync.valueOrNull;

    return Column(
      children: [
        FilterSheetHeader(
          hasActiveFilters: filters.hasActiveFilters,
          onClear: () {
            ref.read(filterStateProvider.notifier).state = const FilterState();
          },
          onClose: () => Navigator.of(context).pop(),
        ),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLowest,
            ),
            child: cachedProviders != null
                ? FilterFormList(
                    scrollController: scrollController,
                    providers: cachedProviders,
                    filters: filters,
                    onFiltersChanged: (next) {
                      ref.read(filterStateProvider.notifier).state = next;
                    },
                  )
                : listAsync.when(
                    loading: () => const FilterFormSkeleton(),
                    error: (error, _) => AsyncErrorView(
                      error: error,
                      onRetry: () => ref
                          .read(providerListNotifierProvider.notifier)
                          .refresh(),
                    ),
                    data: (providers) => FilterFormList(
                      scrollController: scrollController,
                      providers: providers,
                      filters: filters,
                      onFiltersChanged: (next) {
                        ref.read(filterStateProvider.notifier).state = next;
                      },
                    ),
                  ),
          ),
        ),
        FilterSheetActionBar(
          resultCount: resultCount,
          onApply: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
