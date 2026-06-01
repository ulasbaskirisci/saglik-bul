import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/filter_state.dart';

final filterStateProvider = StateProvider<FilterState>(
  (ref) => const FilterState(),
);
