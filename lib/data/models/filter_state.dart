import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_state.freezed.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    String? country,
    String? city,
    String? category,
  }) = _FilterState;

  const FilterState._();

  bool get hasActiveFilters =>
      country != null || city != null || category != null;
}
