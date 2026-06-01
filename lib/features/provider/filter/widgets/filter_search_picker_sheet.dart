import 'package:flutter/material.dart';

import 'filter_picker_empty_state.dart';
import 'filter_picker_tile.dart';

class FilterPickerCancelled {
  const FilterPickerCancelled();
}

/// Searchable bottom sheet for picking a single filter value.
Future<Object?> showFilterSearchPicker({
  required BuildContext context,
  required String title,
  required String allLabel,
  required String searchHint,
  required String noResultsLabel,
  required List<String> items,
  required String? selectedValue,
}) {
  return showModalBottomSheet<Object?>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.4),
    builder: (context) => FilterSearchPickerSheet(
      title: title,
      allLabel: allLabel,
      searchHint: searchHint,
      noResultsLabel: noResultsLabel,
      items: items,
      selectedValue: selectedValue,
    ),
  );
}

class FilterSearchPickerSheet extends StatefulWidget {
  const FilterSearchPickerSheet({
    super.key,
    required this.title,
    required this.allLabel,
    required this.searchHint,
    required this.noResultsLabel,
    required this.items,
    required this.selectedValue,
  });

  final String title;
  final String allLabel;
  final String searchHint;
  final String noResultsLabel;
  final List<String> items;
  final String? selectedValue;

  @override
  State<FilterSearchPickerSheet> createState() =>
      _FilterSearchPickerSheetState();
}

class _FilterSearchPickerSheetState extends State<FilterSearchPickerSheet> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> get _filteredItems {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return widget.items;
    return widget.items
        .where((item) => item.toLowerCase().contains(q))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final maxHeight = MediaQuery.sizeOf(context).height * 0.75;
    final filtered = _filteredItems;
    final showAll = _query.trim().isEmpty ||
        widget.allLabel.toLowerCase().contains(_query.trim().toLowerCase());

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight),
          child: Material(
            color: theme.colorScheme.surface,
            elevation: 16,
            shadowColor: Colors.black26,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 8, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(
                          context,
                          const FilterPickerCancelled(),
                        ),
                        icon: const Icon(Icons.close_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              theme.colorScheme.surfaceContainerHigh,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: SearchBar(
                    controller: _searchController,
                    hintText: widget.searchHint,
                    leading: Icon(
                      Icons.search_rounded,
                      color: theme.colorScheme.primary,
                    ),
                    trailing: _query.isNotEmpty
                        ? [
                            IconButton(
                              icon: const Icon(Icons.clear_rounded),
                              onPressed: () {
                                _searchController.clear();
                                setState(() => _query = '');
                              },
                            ),
                          ]
                        : null,
                    onChanged: (value) => setState(() => _query = value),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 12),
                    ),
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                      theme.colorScheme.surfaceContainerHighest,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: filtered.isEmpty && !showAll
                      ? FilterPickerEmptyState(message: widget.noResultsLabel)
                      : ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 16),
                          itemCount: (showAll ? 1 : 0) + filtered.length,
                          itemBuilder: (context, index) {
                            if (showAll && index == 0) {
                              return FilterPickerTile(
                                label: widget.allLabel,
                                isSelected: widget.selectedValue == null,
                                onTap: () =>
                                    Navigator.pop<String?>(context, null),
                              );
                            }
                            final itemIndex = showAll ? index - 1 : index;
                            final item = filtered[itemIndex];
                            return FilterPickerTile(
                              label: item,
                              isSelected: widget.selectedValue == item,
                              onTap: () => Navigator.pop(context, item),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
