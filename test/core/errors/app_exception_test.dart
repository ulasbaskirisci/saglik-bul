import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/core/errors/app_exception.dart';
import 'package:provider_search/core/errors/error_messages.dart';
import 'package:provider_search/l10n/app_localizations.dart';

void main() {
  test('localized messages map offline and load-failed exceptions', () {
    final l10n = lookupAppLocalizations(const Locale('en'));

    expect(
      localizedErrorMessage(l10n, const OfflineException()),
      l10n.offlineError,
    );
    expect(
      localizedErrorMessage(l10n, const LoadFailedException()),
      l10n.loadFailed,
    );
  });

  test('localized messages fall back for unknown errors', () {
    final l10n = lookupAppLocalizations(const Locale('en'));

    expect(
      localizedErrorMessage(l10n, Exception('raw')),
      l10n.errorGeneric,
    );
  });
}
