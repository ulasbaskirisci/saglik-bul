import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/locale_provider.dart';
import 'locale_chip.dart';

void _setLocale(WidgetRef ref, Locale locale) {
  final current = ref.read(appLocaleProvider);
  if (current == locale) return;
  ref.read(appLocaleProvider.notifier).state = locale;
}

class LocaleToggle extends ConsumerWidget {
  const LocaleToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final locale = ref.watch(appLocaleProvider);
    final isTurkish = locale.languageCode == 'tr';

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              LocaleChip(
                label: 'EN',
                selected: !isTurkish,
                onTap: () => _setLocale(ref, const Locale('en')),
              ),
              LocaleChip(
                label: 'TR',
                selected: isTurkish,
                onTap: () => _setLocale(ref, const Locale('tr')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
