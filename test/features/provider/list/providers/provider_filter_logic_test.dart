import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/data/models/filter_state.dart';
import 'package:provider_search/data/models/provider_profile.dart';
import 'package:provider_search/features/provider/list/providers/provider_filter_logic.dart';

void main() {
  const providers = [
    ProviderProfile(
      id: '1',
      name: 'Alpha Health',
      category: 'Healthcare',
      country: 'Turkey',
      city: 'Ankara',
      rating: 4.0,
      description: 'A',
    ),
    ProviderProfile(
      id: '2',
      name: 'Beta Tech',
      category: 'Technology',
      country: 'Germany',
      city: 'Berlin',
      rating: 5.0,
      description: 'B',
    ),
  ];

  test('search is case-insensitive', () {
    final result = applySearchAndFilters(
      providers: providers,
      searchQuery: 'alpha',
      filters: const FilterState(),
    );

    expect(result, hasLength(1));
    expect(result.first.name, 'Alpha Health');
  });

  test('filters combine with AND logic', () {
    final result = applySearchAndFilters(
      providers: providers,
      searchQuery: '',
      filters: const FilterState(country: 'Turkey', category: 'Technology'),
    );

    expect(result, isEmpty);
  });

  test('country and city filters work together', () {
    final result = applySearchAndFilters(
      providers: providers,
      searchQuery: '',
      filters: const FilterState(country: 'Germany', city: 'Berlin'),
    );

    expect(result, hasLength(1));
    expect(result.first.name, 'Beta Tech');
  });
}
