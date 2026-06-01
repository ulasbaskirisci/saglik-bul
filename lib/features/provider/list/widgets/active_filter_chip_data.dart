import '../../../../data/models/filter_state.dart';
import 'active_filter_chip_type.dart';

class ActiveFilterChipData {
  const ActiveFilterChipData({
    required this.type,
    required this.label,
    required this.nextState,
  });

  final ActiveFilterChipType type;
  final String label;
  final FilterState nextState;
}
