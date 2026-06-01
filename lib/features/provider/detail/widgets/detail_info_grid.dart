import 'package:flutter/material.dart';

import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import 'detail_grid_card.dart';
import 'detail_star_rating.dart';

class DetailInfoGrid extends StatelessWidget {
  const DetailInfoGrid({super.key, required this.profile});

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 520 ? 3 : 2;
        const spacing = 12.0;
        final itemWidth =
            (constraints.maxWidth - spacing * (crossAxisCount - 1)) /
                crossAxisCount;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            SizedBox(
              width: itemWidth,
              height: 148,
              child: DetailGridCard(
                icon: Icons.location_on_rounded,
                label: l10n.location,
                value: '${profile.country}\n${profile.city}',
              ),
            ),
            SizedBox(
              width: itemWidth,
              height: 148,
              child: DetailGridCard(
                icon: Icons.star_rounded,
                label: l10n.rating,
                value: profile.rating.toStringAsFixed(1),
                child: DetailStarRating(rating: profile.rating),
              ),
            ),
            SizedBox(
              width: itemWidth,
              height: 148,
              child: DetailGridCard(
                icon: Icons.medical_services_outlined,
                label: l10n.filterCategory,
                value: profile.category,
              ),
            ),
          ],
        );
      },
    );
  }
}
