import '../models/localized_string.dart';

/// Raw mock entry with EN + TR text; resolved to [ProviderProfile] at runtime.
class MockProviderSeed {
  const MockProviderSeed({
    required this.id,
    required this.name,
    required this.category,
    required this.country,
    required this.city,
    required this.description,
    required this.rating,
    this.phone,
    this.email,
  });

  final String id;
  final LocalizedString name;
  final LocalizedString category;
  final LocalizedString country;
  final LocalizedString city;
  final LocalizedString description;
  final double rating;
  final String? phone;
  final String? email;
}
