import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/filter_state.dart';
import '../../../../l10n/app_localizations.dart';
import '../../filter/providers/filter_state_provider.dart';
import 'active_filter_chip.dart';
import 'active_filter_chip_data.dart';
import 'active_filter_chip_type.dart';

class ActiveFilterChips extends ConsumerWidget {
  const ActiveFilterChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterStateProvider);
    if (!filters.hasActiveFilters) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final chips = _buildChipData(filters);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.colorScheme.primaryContainer.withValues(alpha: 0.45),
              theme.colorScheme.secondaryContainer.withValues(alpha: 0.35),
            ],
          ),
          border: Border.all(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
          ),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primary.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.tune_rounded,
                      size: 16,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      l10n.activeFiltersLabel,
                      style: theme.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      ref.read(filterStateProvider.notifier).state =
                          const FilterState();
                    },
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      l10n.clearAllFilters,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i = 0; i < chips.length; i++) ...[
                      if (i > 0) const SizedBox(width: 8),
                      ActiveFilterChip(
                        type: chips[i].type,
                        label: chips[i].label,
                        onRemove: () => _update(ref, chips[i].nextState),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ActiveFilterChipData> _buildChipData(FilterState filters) {
    final chips = <ActiveFilterChipData>[];
    if (filters.country != null) {
      chips.add(
        ActiveFilterChipData(
          type: ActiveFilterChipType.country,
          label: filters.country!,
          nextState: filters.copyWith(country: null, city: null),
        ),
      );
    }
    if (filters.city != null) {
      chips.add(
        ActiveFilterChipData(
          type: ActiveFilterChipType.city,
          label: filters.city!,
          nextState: filters.copyWith(city: null),
        ),
      );
    }
    if (filters.category != null) {
      chips.add(
        ActiveFilterChipData(
          type: ActiveFilterChipType.category,
          label: filters.category!,
          nextState: filters.copyWith(category: null),
        ),
      );
    }
    return chips;
  }

  void _update(WidgetRef ref, FilterState next) {
    ref.read(filterStateProvider.notifier).state = next;
  }
}
