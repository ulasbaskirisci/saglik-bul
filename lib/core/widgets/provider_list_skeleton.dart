import 'package:flutter/material.dart';

import 'provider_list_skeleton_bones.dart';

class ProviderListSkeleton extends StatelessWidget {
  const ProviderListSkeleton({super.key, this.itemCount = 6});

  final int itemCount;

  /// Skeleton blocks for use inside a [CustomScrollView].
  static List<Widget> slivers({int itemCount = 6}) {
    return [
      const SliverToBoxAdapter(child: ProviderListSkeletonHeaderBone()),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => const Padding(
            padding: EdgeInsets.only(bottom: 4),
            child: ProviderListSkeletonCardBone(),
          ),
          childCount: itemCount,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      children: [
        const ProviderListSkeletonHeaderBone(),
        const SizedBox(height: 12),
        for (var i = 0; i < itemCount; i++) ...[
          if (i > 0) const SizedBox(height: 4),
          const ProviderListSkeletonCardBone(),
        ],
      ],
    );
  }
}
