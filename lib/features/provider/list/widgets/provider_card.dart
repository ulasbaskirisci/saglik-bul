import 'package:flutter/material.dart';

import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import '../../widgets/provider_hero_avatar.dart';
import '../../widgets/provider_hero_name.dart';
import 'provider_category_chip.dart';
import 'provider_rating_badge.dart';

class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.profile,
    required this.onTap,
  });

  final ProviderProfile profile;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;

    return Semantics(
      button: true,
      label: l10n.providerCardSemanticLabel(
        profile.name,
        profile.category,
        profile.city,
        profile.rating.toStringAsFixed(1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Material(
          color: theme.colorScheme.surface,
          elevation: 0,
          shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: theme.colorScheme.outlineVariant.withValues(
                alpha: isDark ? 0.35 : 0.25,
              ),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Ink(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 3,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProviderHeroAvatar(
                      providerId: profile.id,
                      category: profile.category,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProviderHeroName(
                            providerId: profile.id,
                            name: profile.name,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.3,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ProviderCategoryChip(label: profile.category),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.place_outlined,
                                size: 16,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  '${profile.city}, ${profile.country}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                    height: 1.3,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ProviderRatingBadge(rating: profile.rating),
                        const SizedBox(height: 10),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: theme.colorScheme.onSurfaceVariant
                              .withValues(alpha: 0.7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
