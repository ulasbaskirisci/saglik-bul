import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/async_error_view.dart';
import '../../../../core/widgets/offline_banner.dart';
import '../../../../core/widgets/provider_list_skeleton.dart';
import '../providers/filtered_providers_provider.dart';
import '../providers/list_stale_data_provider.dart';
import '../providers/provider_list_notifier.dart';
import '../widgets/provider_list_app_bar.dart';
import '../widgets/provider_list_body.dart';
import '../widgets/provider_list_scroll_view.dart';

class ProviderListScreen extends ConsumerWidget {
  const ProviderListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listAsync = ref.watch(providerListNotifierProvider);
    final filtered = ref.watch(filteredProvidersProvider);
    final showStaleBanner = ref.watch(listStaleDataProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: Column(
        children: [
          if (showStaleBanner)
            OfflineBanner(
              onRetry: () =>
                  ref.read(providerListNotifierProvider.notifier).refresh(),
            ),
          Expanded(
            child: listAsync.when(
              loading: () => ProviderListScrollView(
                slivers: [
                  const ProviderListSliverAppBar(),
                  ...ProviderListSkeleton.slivers(),
                ],
              ),
              error: (error, _) => ProviderListScrollView(
                slivers: [
                  const ProviderListSliverAppBar(),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.55,
                      child: AsyncErrorView(
                        error: error,
                        onRetry: () => ref
                            .read(providerListNotifierProvider.notifier)
                            .refresh(),
                      ),
                    ),
                  ),
                ],
              ),
              data: (_) => ProviderListBody(filtered: filtered),
            ),
          ),
        ],
      ),
    );
  }
}
