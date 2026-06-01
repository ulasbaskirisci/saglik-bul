import '../../../../data/models/filter_state.dart';
import '../../../../data/models/provider_profile.dart';

List<ProviderProfile> applySearchAndFilters({
  required List<ProviderProfile> providers,
  required String searchQuery,
  required FilterState filters,
}) {
  final query = searchQuery.trim().toLowerCase();

  return providers.where((provider) {
    final matchesSearch = query.isEmpty ||
        provider.name.toLowerCase().contains(query) ||
        provider.category.toLowerCase().contains(query) ||
        provider.city.toLowerCase().contains(query) ||
        provider.country.toLowerCase().contains(query);

    final matchesCountry =
        filters.country == null || provider.country == filters.country;
    final matchesCity = filters.city == null || provider.city == filters.city;
    final matchesCategory =
        filters.category == null || provider.category == filters.category;

    return matchesSearch && matchesCountry && matchesCity && matchesCategory;
  }).toList();
}

List<String> distinctCountries(List<ProviderProfile> providers) {
  return providers.map((p) => p.country).toSet().toList()..sort();
}

List<String> distinctCities(List<ProviderProfile> providers, {String? country}) {
  final filtered = country == null
      ? providers
      : providers.where((p) => p.country == country);
  return filtered.map((p) => p.city).toSet().toList()..sort();
}

List<String> distinctCategories(List<ProviderProfile> providers) {
  return providers.map((p) => p.category).toSet().toList()..sort();
}
