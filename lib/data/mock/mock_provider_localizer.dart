import 'package:flutter/material.dart';

import '../models/provider_profile.dart';
import 'mock_provider_seed.dart';
import 'mock_provider_seeds.dart';

List<ProviderProfile> resolveMockProviders(Locale locale) {
  return mockProviderSeeds
      .map((seed) => seed.toProfile(locale.languageCode))
      .toList(growable: false);
}

extension MockProviderSeedX on MockProviderSeed {
  ProviderProfile toProfile(String languageCode) {
    return ProviderProfile(
      id: id,
      name: name.resolve(languageCode),
      category: category.resolve(languageCode),
      country: country.resolve(languageCode),
      city: city.resolve(languageCode),
      rating: rating,
      phone: phone,
      email: email,
      description: description.resolve(languageCode),
    );
  }
}
