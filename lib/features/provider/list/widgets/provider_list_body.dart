import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/async_empty_view.dart';
import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/provider_list_notifier.dart';
import 'active_filter_chips.dart';
import 'list_refresh_overlay.dart';
import 'provider_card.dart';
import 'provider_list_app_bar.dart';
import 'provider_list_header.dart';
import 'provider_list_scroll_view.dart';

class ProviderListBody extends ConsumerWidget {
  const ProviderListBody({super.key, required this.filtered});

  final List<ProviderProfile> filtered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final listAsync = ref.watch(providerListNotifierProvider);
    final isRefreshing = listAsync.isLoading && listAsync.hasValue;

    final contentSlivers = <Widget>[
      SliverToBoxAdapter(
        child: ProviderListHeader(resultCount: filtered.length),
      ),
      const SliverToBoxAdapter(child: ActiveFilterChips()),
      if (filtered.isEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 48, bottom: 48),
            child: AsyncEmptyView(
              title: l10n.emptyProvidersTitle,
              subtitle: l10n.emptyProvidersSubtitle,
            ),
          ),
        )
      else
        SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final profile = filtered[index];
                return ProviderCard(
                  profile: profile,
                  onTap: () => context.push('/detail/${profile.id}'),
                );
              },
              childCount: filtered.length,
            ),
          ),
        ),
    ];

    return Stack(
      children: [
        ProviderListScrollView(
          slivers: [
            const ProviderListSliverAppBar(),
            ...contentSlivers,
          ],
        ),
        if (isRefreshing) const ListRefreshOverlay(),
      ],
    );
  }
}
