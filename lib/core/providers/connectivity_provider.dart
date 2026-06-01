import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../network/connectivity_service.dart';

final connectivityServiceProvider = Provider<ConnectivityService>(
  (ref) => MockConnectivityService(),
);
