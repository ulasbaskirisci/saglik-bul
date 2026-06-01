import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_profile.freezed.dart';
part 'provider_profile.g.dart';

@freezed
class ProviderProfile with _$ProviderProfile {
  const factory ProviderProfile({
    required String id,
    required String name,
    required String category,
    required String country,
    required String city,
    required double rating,
    String? phone,
    String? email,
    required String description,
  }) = _ProviderProfile;

  factory ProviderProfile.fromJson(Map<String, dynamic> json) =>
      _$ProviderProfileFromJson(json);
}
