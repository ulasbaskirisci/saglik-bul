import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../offline/offline_simulator.dart';

final offlineSimulatorProvider = Provider<OfflineSimulator>(
  (ref) => MockOfflineSimulator(),
);
