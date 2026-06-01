import 'package:flutter/material.dart';

import '../list/widgets/provider_category_icon.dart';
import 'provider_hero_tags.dart';

/// Category avatar shared by list cards and detail hero (Hero target).
class ProviderHeroAvatar extends StatelessWidget {
  const ProviderHeroAvatar({
    super.key,
    required this.providerId,
    required this.category,
    this.size = 52,
    this.borderRadius = 16,
    this.iconSize = 26,
    this.enableHero = true,
  });

  final String providerId;
  final String category;
  final double size;
  final double borderRadius;
  final double iconSize;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = categoryIconFor(category);

    final avatar = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer,
            theme.colorScheme.tertiaryContainer.withValues(alpha: 0.85),
          ],
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.primary.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        color: theme.colorScheme.onPrimaryContainer,
        size: iconSize,
      ),
    );

    if (!enableHero) return avatar;

    return Hero(
      tag: ProviderHeroTags.avatar(providerId),
      child: Material(
        color: Colors.transparent,
        child: avatar,
      ),
    );
  }
}
