import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/mock/mock_provider_repository.dart';
import '../../data/repositories/provider_repository.dart';
import 'offline_simulator_provider.dart';

final providerRepositoryProvider = Provider<ProviderRepository>(
  (ref) => MockProviderRepository(
    offlineSimulator: ref.watch(offlineSimulatorProvider),
  ),
);
