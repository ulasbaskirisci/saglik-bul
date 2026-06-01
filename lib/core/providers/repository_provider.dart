import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/mock/mock_provider_repository.dart';
import '../../data/repositories/provider_repository.dart';
import 'connectivity_provider.dart';

final providerRepositoryProvider = Provider<ProviderRepository>(
  (ref) => MockProviderRepository(
    connectivity: ref.watch(connectivityServiceProvider),
  ),
);
