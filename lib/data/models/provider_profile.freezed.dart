// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProviderProfile _$ProviderProfileFromJson(Map<String, dynamic> json) {
  return _ProviderProfile.fromJson(json);
}

/// @nodoc
mixin _$ProviderProfile {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this ProviderProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProviderProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProviderProfileCopyWith<ProviderProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProviderProfileCopyWith<$Res> {
  factory $ProviderProfileCopyWith(
          ProviderProfile value, $Res Function(ProviderProfile) then) =
      _$ProviderProfileCopyWithImpl<$Res, ProviderProfile>;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String country,
      String city,
      double rating,
      String? phone,
      String? email,
      String description});
}

/// @nodoc
class _$ProviderProfileCopyWithImpl<$Res, $Val extends ProviderProfile>
    implements $ProviderProfileCopyWith<$Res> {
  _$ProviderProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProviderProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? country = null,
    Object? city = null,
    Object? rating = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProviderProfileImplCopyWith<$Res>
    implements $ProviderProfileCopyWith<$Res> {
  factory _$$ProviderProfileImplCopyWith(_$ProviderProfileImpl value,
          $Res Function(_$ProviderProfileImpl) then) =
      __$$ProviderProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      String country,
      String city,
      double rating,
      String? phone,
      String? email,
      String description});
}

/// @nodoc
class __$$ProviderProfileImplCopyWithImpl<$Res>
    extends _$ProviderProfileCopyWithImpl<$Res, _$ProviderProfileImpl>
    implements _$$ProviderProfileImplCopyWith<$Res> {
  __$$ProviderProfileImplCopyWithImpl(
      _$ProviderProfileImpl _value, $Res Function(_$ProviderProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProviderProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? country = null,
    Object? city = null,
    Object? rating = null,
    Object? phone = freezed,
    Object? email = freezed,
    Object? description = null,
  }) {
    return _then(_$ProviderProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProviderProfileImpl implements _ProviderProfile {
  const _$ProviderProfileImpl(
      {required this.id,
      required this.name,
      required this.category,
      required this.country,
      required this.city,
      required this.rating,
      this.phone,
      this.email,
      required this.description});

  factory _$ProviderProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProviderProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String category;
  @override
  final String country;
  @override
  final String city;
  @override
  final double rating;
  @override
  final String? phone;
  @override
  final String? email;
  @override
  final String description;

  @override
  String toString() {
    return 'ProviderProfile(id: $id, name: $name, category: $category, country: $country, city: $city, rating: $rating, phone: $phone, email: $email, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProviderProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, category, country,
      city, rating, phone, email, description);

  /// Create a copy of ProviderProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProviderProfileImplCopyWith<_$ProviderProfileImpl> get copyWith =>
      __$$ProviderProfileImplCopyWithImpl<_$ProviderProfileImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProviderProfileImplToJson(
      this,
    );
  }
}

abstract class _ProviderProfile implements ProviderProfile {
  const factory _ProviderProfile(
      {required final String id,
      required final String name,
      required final String category,
      required final String country,
      required final String city,
      required final double rating,
      final String? phone,
      final String? email,
      required final String description}) = _$ProviderProfileImpl;

  factory _ProviderProfile.fromJson(Map<String, dynamic> json) =
      _$ProviderProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get category;
  @override
  String get country;
  @override
  String get city;
  @override
  double get rating;
  @override
  String? get phone;
  @override
  String? get email;
  @override
  String get description;

  /// Create a copy of ProviderProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProviderProfileImplCopyWith<_$ProviderProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
