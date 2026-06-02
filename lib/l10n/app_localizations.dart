import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'SağlıkBul'**
  String get appTitle;

  /// No description provided for @splashTagline.
  ///
  /// In en, this message translates to:
  /// **'Find trusted healthcare providers'**
  String get splashTagline;

  /// No description provided for @providersTitle.
  ///
  /// In en, this message translates to:
  /// **'Providers'**
  String get providersTitle;

  /// No description provided for @filtersTitle.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersTitle;

  /// No description provided for @providerDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Provider Details'**
  String get providerDetailsTitle;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name, category, city...'**
  String get searchHint;

  /// No description provided for @listResultCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No providers} =1{1 provider} other{{count} providers}}'**
  String listResultCount(int count);

  /// No description provided for @filtersTooltip.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get filtersTooltip;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @applyAndBack.
  ///
  /// In en, this message translates to:
  /// **'Apply & Back'**
  String get applyAndBack;

  /// No description provided for @filtersSheetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Refine by location and specialty'**
  String get filtersSheetSubtitle;

  /// No description provided for @showResults.
  ///
  /// In en, this message translates to:
  /// **'Show {count} results'**
  String showResults(int count);

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterCountry.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get filterCountry;

  /// No description provided for @filterCity.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get filterCity;

  /// No description provided for @filterCategory.
  ///
  /// In en, this message translates to:
  /// **'Category / Branch'**
  String get filterCategory;

  /// No description provided for @filterSectionLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get filterSectionLocation;

  /// No description provided for @filterSectionSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Specialty'**
  String get filterSectionSpecialty;

  /// No description provided for @filterSearchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country...'**
  String get filterSearchCountry;

  /// No description provided for @filterSearchCity.
  ///
  /// In en, this message translates to:
  /// **'Search city...'**
  String get filterSearchCity;

  /// No description provided for @filterSearchCategory.
  ///
  /// In en, this message translates to:
  /// **'Search branch or category...'**
  String get filterSearchCategory;

  /// No description provided for @filterSearchNoResults.
  ///
  /// In en, this message translates to:
  /// **'No matches found'**
  String get filterSearchNoResults;

  /// No description provided for @filtersActiveHint.
  ///
  /// In en, this message translates to:
  /// **'Filters apply instantly as you select'**
  String get filtersActiveHint;

  /// No description provided for @activeFiltersLabel.
  ///
  /// In en, this message translates to:
  /// **'Active filters'**
  String get activeFiltersLabel;

  /// No description provided for @clearAllFilters.
  ///
  /// In en, this message translates to:
  /// **'Clear all'**
  String get clearAllFilters;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @errorTitle.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get errorTitle;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorGeneric;

  /// No description provided for @offlineError.
  ///
  /// In en, this message translates to:
  /// **'You appear to be offline. Check your connection.'**
  String get offlineError;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Unable to load providers. Please try again.'**
  String get loadFailed;

  /// No description provided for @profileLoadErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Could not load profile'**
  String get profileLoadErrorTitle;

  /// No description provided for @emptyProvidersTitle.
  ///
  /// In en, this message translates to:
  /// **'No providers found'**
  String get emptyProvidersTitle;

  /// No description provided for @emptyProvidersSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Try adjusting your search or filters'**
  String get emptyProvidersSubtitle;

  /// No description provided for @providerNotFoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Provider not found'**
  String get providerNotFoundTitle;

  /// No description provided for @providerNotFoundSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This profile may have been removed'**
  String get providerNotFoundSubtitle;

  /// No description provided for @offlineBannerMessage.
  ///
  /// In en, this message translates to:
  /// **'Showing saved results — connection unavailable'**
  String get offlineBannerMessage;

  /// No description provided for @contactUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Contact information not available'**
  String get contactUnavailable;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @callAction.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callAction;

  /// No description provided for @emailAction.
  ///
  /// In en, this message translates to:
  /// **'Send email'**
  String get emailAction;

  /// No description provided for @detailOverviewSection.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get detailOverviewSection;

  /// No description provided for @contactSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contactSectionTitle;

  /// No description provided for @launchContactError.
  ///
  /// In en, this message translates to:
  /// **'Could not open this link on your device'**
  String get launchContactError;

  /// No description provided for @notFoundPageTitle.
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundPageTitle;

  /// No description provided for @notFoundPageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The route you requested does not exist.'**
  String get notFoundPageSubtitle;

  /// No description provided for @goToProviders.
  ///
  /// In en, this message translates to:
  /// **'Go to providers'**
  String get goToProviders;

  /// No description provided for @providerCardSemanticLabel.
  ///
  /// In en, this message translates to:
  /// **'{name}, {category}, {city}, rating {rating}'**
  String providerCardSemanticLabel(String name, String category, String city, String rating);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
