import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'SağlıkBul';

  @override
  String get splashTagline => 'Find trusted healthcare providers';

  @override
  String get providersTitle => 'Providers';

  @override
  String get filtersTitle => 'Filters';

  @override
  String get providerDetailsTitle => 'Provider Details';

  @override
  String get searchHint => 'Search by name, category, city...';

  @override
  String listResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count providers',
      one: '1 provider',
      zero: 'No providers',
    );
    return '$_temp0';
  }

  @override
  String get filtersTooltip => 'Filters';

  @override
  String get clear => 'Clear';

  @override
  String get applyAndBack => 'Apply & Back';

  @override
  String get filtersSheetSubtitle => 'Refine by location and specialty';

  @override
  String showResults(int count) {
    return 'Show $count results';
  }

  @override
  String get filterAll => 'All';

  @override
  String get filterCountry => 'Country';

  @override
  String get filterCity => 'City';

  @override
  String get filterCategory => 'Category / Branch';

  @override
  String get filterSectionLocation => 'Location';

  @override
  String get filterSectionSpecialty => 'Specialty';

  @override
  String get filterSearchCountry => 'Search country...';

  @override
  String get filterSearchCity => 'Search city...';

  @override
  String get filterSearchCategory => 'Search branch or category...';

  @override
  String get filterSearchNoResults => 'No matches found';

  @override
  String get filtersActiveHint => 'Filters apply instantly as you select';

  @override
  String get activeFiltersLabel => 'Active filters';

  @override
  String get clearAllFilters => 'Clear all';

  @override
  String get retry => 'Retry';

  @override
  String get errorTitle => 'Something went wrong';

  @override
  String get errorGeneric => 'Something went wrong. Please try again.';

  @override
  String get offlineError => 'You appear to be offline. Check your connection.';

  @override
  String get loadFailed => 'Unable to load providers. Please try again.';

  @override
  String get profileLoadErrorTitle => 'Could not load profile';

  @override
  String get emptyProvidersTitle => 'No providers found';

  @override
  String get emptyProvidersSubtitle => 'Try adjusting your search or filters';

  @override
  String get providerNotFoundTitle => 'Provider not found';

  @override
  String get providerNotFoundSubtitle => 'This profile may have been removed';

  @override
  String get offlineBannerMessage => 'Showing saved results — connection unavailable';

  @override
  String get contactUnavailable => 'Contact information not available';

  @override
  String get about => 'About';

  @override
  String get location => 'Location';

  @override
  String get rating => 'Rating';

  @override
  String get phone => 'Phone';

  @override
  String get email => 'Email';

  @override
  String get callAction => 'Call';

  @override
  String get emailAction => 'Send email';

  @override
  String get detailOverviewSection => 'Overview';

  @override
  String get contactSectionTitle => 'Contact';

  @override
  String get launchContactError => 'Could not open this link on your device';

  @override
  String get notFoundPageTitle => 'Page not found';

  @override
  String get notFoundPageSubtitle => 'The route you requested does not exist.';

  @override
  String get goToProviders => 'Go to providers';

  @override
  String providerCardSemanticLabel(String name, String category, String city, String rating) {
    return '$name, $category, $city, rating $rating';
  }
}
