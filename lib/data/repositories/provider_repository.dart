import 'package:flutter/material.dart';

import '../models/provider_profile.dart';

abstract class ProviderRepository {
  Future<List<ProviderProfile>> fetchProviders({required Locale locale});

  Future<ProviderProfile?> getProviderById(
    String id, {
    required Locale locale,
  });
}
