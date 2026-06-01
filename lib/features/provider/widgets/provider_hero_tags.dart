/// Stable Hero tags for list → detail transitions.
abstract final class ProviderHeroTags {
  static String avatar(String providerId) => 'provider-avatar-$providerId';

  static String name(String providerId) => 'provider-name-$providerId';
}
