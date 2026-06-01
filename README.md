# SağlıkBul

Flutter case study: provider list, filter, and profile detail. Mock data only; no backend.

**Stack:** Flutter · Riverpod · go_router · Freezed · l10n (EN/TR)

## Flow

List → Filter (bottom sheet) → Detail

| Route | Screen |
|-------|--------|
| `/splash` | Brand intro, then auto-navigate to list |
| `/list` | Search, results, filters, pull-to-refresh |
| *(modal)* | Country, city, category |
| `/detail/:id` | Profile, contact, bio |

Filter is implemented as a bottom sheet (not `/filter`) to keep list context and match common mobile patterns. Functionally it is the second screen in the case study flow.

## Architecture

```
View → Riverpod → ProviderRepository → MockProviderRepository + ConnectivityService
```

- **View** — Screens under `features/*/view`; UI in `widgets/` and `core/widgets/`.
- **State** — Riverpod notifiers and derived providers; no separate ViewModel classes.
- **Data** — `ProviderRepository` interface; mock implementation with in-memory cache and offline simulation.
- **Models** — `ProviderProfile` (Freezed); name avoids clash with Riverpod `Provider`.

## State management

| Concern | Implementation |
|---------|----------------|
| List load / refresh | `providerListNotifierProvider` (`AsyncNotifier`) |
| Search & filters | `searchQueryProvider`, `filterStateProvider`, `filteredProvidersProvider` |
| Detail | `providerDetailProvider(id)` — list cache first, then repository |
| Locale | `appLocaleProvider`; `localeChangeEffectsProvider` refreshes data and resets filters |
| Errors | `AppException` + localized messages; stale list on failed refresh |

Filtering logic is pure Dart (`provider_filter_logic.dart`) and covered by unit tests.

## Technical decisions

- **Riverpod** — Typed async flows, test overrides, minimal boilerplate.
- **go_router** — `/list`, `/detail/:id`, 404 via `errorBuilder`.
- **Repository boundary** — UI unchanged when swapping mock for a real API.
- **Modal filter** — Three-screen requirement without an extra route or list reload.
- **Nullable contact fields** — Explicit empty state when phone and email are missing.

## Project layout

```
lib/
├── core/          # theme, errors, connectivity, shared widgets
├── data/          # models, repository, mock seeds
├── features/provider/
│   ├── list/
│   ├── filter/
│   └── detail/
├── l10n/
└── router/
```

## Setup

```bash
flutter pub get
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Tests

```bash
flutter test
flutter test integration_test/app_flow_test.dart
```

Unit and widget tests: filter logic, repository, list/detail notifiers, key widgets. Integration test: list → filter sheet → detail.

## Notes for reviewers

- **Offline / retry:** `MockConnectivityService.online`; pull-to-refresh on list; retry on detail. Optional initial error: `simulateInitialError: true` in `repository_provider.dart`.
- **Locale:** EN \| TR toggle in the list app bar; mock content is bilingual.
- **CI:** `.github/workflows/ci.yml` — analyze and test on push/PR.
