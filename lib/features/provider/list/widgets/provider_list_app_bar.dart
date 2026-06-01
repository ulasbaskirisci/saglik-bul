import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/locale_toggle.dart';
import '../../../../l10n/app_localizations.dart';
import '../../filter/providers/filter_state_provider.dart';
import '../../filter/widgets/provider_filter_sheet.dart';

class ProviderListSliverAppBar extends ConsumerWidget {
  const ProviderListSliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final filters = ref.watch(filterStateProvider);
    final theme = Theme.of(context);

    return SliverAppBar.large(
      pinned: true,
      stretch: true,
      surfaceTintColor: theme.colorScheme.surface,
      backgroundColor: theme.colorScheme.surface,
      title: Text(
        l10n.providersTitle,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      actions: [
        const LocaleToggle(),
        IconButton(
          icon: Badge(
            isLabelVisible: filters.hasActiveFilters,
            smallSize: 8,
            child: const Icon(Icons.filter_list),
          ),
          tooltip: l10n.filtersTooltip,
          onPressed: () => showProviderFilterSheet(context),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
