import 'package:flutter/material.dart';

import '../../../../l10n/app_localizations.dart';

class FilterSheetActionBar extends StatelessWidget {
  const FilterSheetActionBar({
    super.key,
    required this.resultCount,
    required this.onApply,
  });

  final int resultCount;
  final VoidCallback onApply;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.shadow.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 12),
      child: SafeArea(
        top: false,
        child: FilledButton(
          onPressed: onApply,
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(54),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_rounded, size: 22),
              const SizedBox(width: 8),
              Text(
                l10n.showResults(resultCount),
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
