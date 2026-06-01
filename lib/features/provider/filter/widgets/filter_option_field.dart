import 'package:flutter/material.dart';

import 'filter_search_picker_sheet.dart';

class FilterOptionField extends StatelessWidget {
  const FilterOptionField({
    super.key,
    required this.icon,
    required this.label,
    required this.allLabel,
    required this.searchHint,
    required this.noResultsLabel,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final IconData icon;
  final String label;
  final String allLabel;
  final String searchHint;
  final String noResultsLabel;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  bool get _hasSelection => value != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final displayValue = value ?? allLabel;

    return Material(
      color: _hasSelection
          ? theme.colorScheme.primaryContainer.withValues(alpha: 0.25)
          : theme.colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(
          color: _hasSelection
              ? theme.colorScheme.primary.withValues(alpha: 0.45)
              : theme.colorScheme.outlineVariant.withValues(alpha: 0.35),
          width: _hasSelection ? 1.5 : 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openPicker(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _hasSelection
                        ? [
                            theme.colorScheme.primary,
                            theme.colorScheme.primary.withValues(alpha: 0.75),
                          ]
                        : [
                            theme.colorScheme.primaryContainer,
                            theme.colorScheme.secondaryContainer,
                          ],
                  ),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  size: 23,
                  color: _hasSelection
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      displayValue,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: _hasSelection
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurface,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.unfold_more_rounded,
                color: _hasSelection
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openPicker(BuildContext context) async {
    final picked = await showFilterSearchPicker(
      context: context,
      title: label,
      allLabel: allLabel,
      searchHint: searchHint,
      noResultsLabel: noResultsLabel,
      items: items,
      selectedValue: value,
    );

    if (!context.mounted || picked is FilterPickerCancelled) return;
    final next = picked as String?;
    if (next == value) return;
    onChanged(next);
  }
}
