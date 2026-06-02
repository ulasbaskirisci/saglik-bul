import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'SağlıkBul';

  @override
  String get splashTagline => 'Güvenilir sağlık hizmetlerini keşfet';

  @override
  String get providersTitle => 'Sağlayıcılar';

  @override
  String get filtersTitle => 'Filtreler';

  @override
  String get providerDetailsTitle => 'Sağlayıcı Detayı';

  @override
  String get searchHint => 'İsim, kategori veya şehir ara...';

  @override
  String listResultCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sağlayıcı',
      one: '1 sağlayıcı',
      zero: 'Sağlayıcı yok',
    );
    return '$_temp0';
  }

  @override
  String get filtersTooltip => 'Filtreler';

  @override
  String get clear => 'Temizle';

  @override
  String get applyAndBack => 'Uygula ve Geri';

  @override
  String get filtersSheetSubtitle => 'Konum ve branşa göre daralt';

  @override
  String showResults(int count) {
    return '$count sonuç göster';
  }

  @override
  String get filterAll => 'Tümü';

  @override
  String get filterCountry => 'Ülke';

  @override
  String get filterCity => 'Şehir';

  @override
  String get filterCategory => 'Branş / Kategori';

  @override
  String get filterSectionLocation => 'Konum';

  @override
  String get filterSectionSpecialty => 'Branş';

  @override
  String get filterSearchCountry => 'Ülke ara...';

  @override
  String get filterSearchCity => 'Şehir ara...';

  @override
  String get filterSearchCategory => 'Branş veya kategori ara...';

  @override
  String get filterSearchNoResults => 'Sonuç bulunamadı';

  @override
  String get filtersActiveHint => 'Seçimler anında uygulanır';

  @override
  String get activeFiltersLabel => 'Aktif filtreler';

  @override
  String get clearAllFilters => 'Tümünü temizle';

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get errorTitle => 'Bir şeyler ters gitti';

  @override
  String get errorGeneric => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

  @override
  String get offlineError => 'Çevrimdışı görünüyorsunuz. Bağlantınızı kontrol edin.';

  @override
  String get loadFailed => 'Sağlayıcılar yüklenemedi. Lütfen tekrar deneyin.';

  @override
  String get profileLoadErrorTitle => 'Profil yüklenemedi';

  @override
  String get emptyProvidersTitle => 'Sağlayıcı bulunamadı';

  @override
  String get emptyProvidersSubtitle => 'Arama veya filtreleri değiştirmeyi deneyin';

  @override
  String get providerNotFoundTitle => 'Sağlayıcı bulunamadı';

  @override
  String get providerNotFoundSubtitle => 'Bu profil kaldırılmış olabilir';

  @override
  String get offlineBannerMessage => 'Kayıtlı sonuçlar gösteriliyor — bağlantı yok';

  @override
  String get contactUnavailable => 'İletişim bilgisi mevcut değil';

  @override
  String get about => 'Hakkında';

  @override
  String get location => 'Konum';

  @override
  String get rating => 'Puan';

  @override
  String get phone => 'Telefon';

  @override
  String get email => 'E-posta';

  @override
  String get callAction => 'Ara';

  @override
  String get emailAction => 'E-posta gönder';

  @override
  String get detailOverviewSection => 'Genel Bakış';

  @override
  String get contactSectionTitle => 'İletişim';

  @override
  String get launchContactError => 'Bağlantı bu cihazda açılamadı';

  @override
  String get notFoundPageTitle => 'Sayfa bulunamadı';

  @override
  String get notFoundPageSubtitle => 'İstediğiniz sayfa mevcut değil.';

  @override
  String get goToProviders => 'Sağlayıcılara git';

  @override
  String providerCardSemanticLabel(String name, String category, String city, String rating) {
    return '$name, $category, $city, puan $rating';
  }
}
