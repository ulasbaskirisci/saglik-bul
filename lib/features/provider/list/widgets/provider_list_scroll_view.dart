import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider_list_notifier.dart';

class ProviderListScrollView extends ConsumerWidget {
  const ProviderListScrollView({super.key, required this.slivers});

  final List<Widget> slivers;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topInset = MediaQuery.paddingOf(context).top;

    return RefreshIndicator(
      displacement: topInset + kToolbarHeight + 48,
      edgeOffset: topInset,
      onRefresh: () =>
          ref.read(providerListNotifierProvider.notifier).refresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: slivers,
      ),
    );
  }
}
