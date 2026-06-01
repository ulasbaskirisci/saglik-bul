import 'package:flutter/material.dart';

import '../../../../data/models/provider_profile.dart';
import '../../widgets/provider_hero_avatar.dart';
import '../../widgets/provider_hero_name.dart';
import 'detail_hero_chip.dart';

class DetailFlexibleHero extends StatelessWidget {
  const DetailFlexibleHero({super.key, required this.profile});

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            cs.surfaceContainerLow,
            cs.surface,
          ],
        ),
        border: Border(
          bottom: BorderSide(
            color: cs.outlineVariant.withValues(alpha: 0.45),
          ),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProviderHeroAvatar(
                        providerId: profile.id,
                        category: profile.category,
                        size: 80,
                        borderRadius: 22,
                        iconSize: 40,
                      ),
                      const SizedBox(height: 14),
                      ProviderHeroName(
                        providerId: profile.id,
                        name: profile.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.4,
                          color: cs.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          DetailHeroChip(
                            icon: Icons.category_rounded,
                            label: profile.category,
                          ),
                          DetailHeroChip(
                            icon: Icons.star_rounded,
                            label: profile.rating.toStringAsFixed(1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
