import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Locale _initialLocale() {
  final system = WidgetsBinding.instance.platformDispatcher.locale;
  if (system.languageCode == 'tr') {
    return const Locale('tr');
  }
  return const Locale('en');
}

/// App-wide locale override (EN / TR). Defaults from system language on first launch.
final appLocaleProvider = StateProvider<Locale>((ref) => _initialLocale());
