import 'package:flutter_riverpod/flutter_riverpod.dart';

/// True when refresh failed but cached list data is still shown.
final listStaleDataProvider = StateProvider<bool>((ref) => false);
