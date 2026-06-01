import '../../l10n/app_localizations.dart';
import 'app_exception.dart';

String localizedErrorMessage(AppLocalizations l10n, Object error) {
  return switch (error) {
    OfflineException() => l10n.offlineError,
    NetworkException() => l10n.networkError,
    _ => l10n.errorGeneric,
  };
}
