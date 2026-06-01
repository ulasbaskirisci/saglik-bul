import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../l10n/app_localizations.dart';
import '../providers/search_query_provider.dart';

class ProviderSearchBar extends ConsumerStatefulWidget {
  const ProviderSearchBar({super.key, this.compact = false});

  /// When true, omits outer padding (used inside [ProviderListHeader]).
  final bool compact;

  @override
  ConsumerState<ProviderSearchBar> createState() => _ProviderSearchBarState();
}

class _ProviderSearchBarState extends ConsumerState<ProviderSearchBar> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ref.read(searchQueryProvider),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final searchQuery = ref.watch(searchQueryProvider);

    ref.listen<String>(searchQueryProvider, (previous, next) {
      if (_controller.text != next) {
        _controller.text = next;
      }
    });

    final searchField = SearchBar(
      controller: _controller,
      hintText: l10n.searchHint,
      backgroundColor: WidgetStatePropertyAll(
        theme.colorScheme.surface,
      ),
      elevation: const WidgetStatePropertyAll(0),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12),
      ),
      leading: Icon(
        Icons.search_rounded,
        color: theme.colorScheme.primary,
      ),
      trailing: searchQuery.isNotEmpty
          ? [
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  _controller.clear();
                  ref.read(searchQueryProvider.notifier).state = '';
                },
              ),
            ]
          : null,
      onChanged: (value) {
        ref.read(searchQueryProvider.notifier).state = value;
      },
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
          ),
        ),
      ),
    );

    if (widget.compact) {
      return searchField;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
      child: searchField,
    );
  }
}
