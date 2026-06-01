import 'package:flutter/material.dart';

import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import 'detail_about_card.dart';
import 'detail_contact_grid.dart';
import 'detail_flexible_hero.dart';
import 'detail_info_grid.dart';
import 'detail_section_header.dart';

class ProviderDetailContent extends StatelessWidget {
  const ProviderDetailContent({super.key, required this.profile});

  static const double heroExpandedHeight = 248;

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: heroExpandedHeight,
          pinned: true,
          stretch: true,
          leading: const BackButton(),
          title: Text(
            profile.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            stretchModes: const [
              StretchMode.zoomBackground,
              StretchMode.blurBackground,
            ],
            background: DetailFlexibleHero(profile: profile),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailSectionHeader(
                  icon: Icons.dashboard_rounded,
                  title: l10n.detailOverviewSection,
                ),
                const SizedBox(height: 12),
                DetailInfoGrid(profile: profile),
                const SizedBox(height: 24),
                DetailSectionHeader(
                  icon: Icons.forum_outlined,
                  title: l10n.contactSectionTitle,
                ),
                const SizedBox(height: 12),
                DetailContactGrid(profile: profile),
                const SizedBox(height: 24),
                DetailSectionHeader(
                  icon: Icons.article_outlined,
                  title: l10n.about,
                ),
                const SizedBox(height: 12),
                DetailAboutCard(text: profile.description),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
