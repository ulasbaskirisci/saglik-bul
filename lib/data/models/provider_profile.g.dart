// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProviderProfileImpl _$$ProviderProfileImplFromJson(
        Map<String, dynamic> json) =>
    _$ProviderProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      country: json['country'] as String,
      city: json['city'] as String,
      rating: (json['rating'] as num).toDouble(),
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$ProviderProfileImplToJson(
        _$ProviderProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'country': instance.country,
      'city': instance.city,
      'rating': instance.rating,
      'phone': instance.phone,
      'email': instance.email,
      'description': instance.description,
    };
