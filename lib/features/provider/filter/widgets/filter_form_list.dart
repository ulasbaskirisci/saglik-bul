import 'package:flutter/material.dart';

import '../../../../data/models/filter_state.dart';
import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import '../../list/providers/provider_filter_logic.dart';
import 'filter_option_field.dart';
import 'filter_section_label.dart';

class FilterFormList extends StatelessWidget {
  const FilterFormList({
    super.key,
    required this.scrollController,
    required this.providers,
    required this.filters,
    required this.onFiltersChanged,
  });

  final ScrollController scrollController;
  final List<ProviderProfile> providers;
  final FilterState filters;
  final ValueChanged<FilterState> onFiltersChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final countries = distinctCountries(providers);
    final cities = distinctCities(providers, country: filters.country);
    final categories = distinctCategories(providers);

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      children: [
        FilterSectionLabel(
          icon: Icons.travel_explore_rounded,
          label: l10n.filterSectionLocation,
        ),
        const SizedBox(height: 10),
        FilterOptionField(
          key: ValueKey('country-${filters.country}'),
          icon: Icons.public_rounded,
          label: l10n.filterCountry,
          allLabel: l10n.filterAll,
          searchHint: l10n.filterSearchCountry,
          noResultsLabel: l10n.filterSearchNoResults,
          value: filters.country,
          items: countries,
          onChanged: (value) {
            onFiltersChanged(filters.copyWith(country: value, city: null));
          },
        ),
        const SizedBox(height: 10),
        FilterOptionField(
          key: ValueKey('city-${filters.country}-${filters.city}'),
          icon: Icons.location_city_rounded,
          label: l10n.filterCity,
          allLabel: l10n.filterAll,
          searchHint: l10n.filterSearchCity,
          noResultsLabel: l10n.filterSearchNoResults,
          value: filters.city,
          items: cities,
          onChanged: (value) {
            onFiltersChanged(filters.copyWith(city: value));
          },
        ),
        const SizedBox(height: 22),
        FilterSectionLabel(
          icon: Icons.medical_information_outlined,
          label: l10n.filterSectionSpecialty,
        ),
        const SizedBox(height: 10),
        FilterOptionField(
          key: ValueKey('category-${filters.category}'),
          icon: Icons.medical_services_outlined,
          label: l10n.filterCategory,
          allLabel: l10n.filterAll,
          searchHint: l10n.filterSearchCategory,
          noResultsLabel: l10n.filterSearchNoResults,
          value: filters.category,
          items: categories,
          onChanged: (value) {
            onFiltersChanged(filters.copyWith(category: value));
          },
        ),
        if (filters.hasActiveFilters) ...[
          const SizedBox(height: 20),
          Text(
            l10n.filtersActiveHint,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}
