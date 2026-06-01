import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/widgets/async_empty_view.dart';
import '../../../../core/widgets/async_error_view.dart';
import '../../../../core/widgets/provider_list_skeleton.dart';
import '../../../../l10n/app_localizations.dart';
import '../providers/provider_detail_provider.dart';
import '../widgets/detail_scroll_shell.dart';
import '../widgets/provider_detail_content.dart';

class ProviderDetailScreen extends ConsumerWidget {
  const ProviderDetailScreen({super.key, required this.providerId});

  final String providerId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(providerDetailProvider(providerId));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
      body: detailAsync.when(
        loading: () => CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: const BackButton(),
              title: Text(l10n.providerDetailsTitle),
            ),
            ...ProviderListSkeleton.slivers(itemCount: 3),
          ],
        ),
        error: (error, _) => DetailScrollShell(
          title: l10n.providerDetailsTitle,
          child: AsyncErrorView(
            error: error,
            title: l10n.profileLoadErrorTitle,
            onRetry: () =>
                ref.read(providerDetailProvider(providerId).notifier).retry(),
          ),
        ),
        data: (profile) {
          if (profile == null) {
            return DetailScrollShell(
              title: l10n.providerDetailsTitle,
              child: Center(
                child: AsyncEmptyView(
                  icon: Icons.person_off_outlined,
                  title: l10n.providerNotFoundTitle,
                  subtitle: l10n.providerNotFoundSubtitle,
                ),
              ),
            );
          }

          return ProviderDetailContent(profile: profile);
        },
      ),
    );
  }
}
