import '../../l10n/app_localizations.dart';
import 'app_exception.dart';

String localizedErrorMessage(AppLocalizations l10n, Object error) {
  return switch (error) {
    OfflineException() => l10n.offlineError,
    LoadFailedException() => l10n.loadFailed,
    _ => l10n.errorGeneric,
  };
}
