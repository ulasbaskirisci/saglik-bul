import 'package:flutter/material.dart';

import 'provider_hero_tags.dart';

class ProviderHeroName extends StatelessWidget {
  const ProviderHeroName({
    super.key,
    required this.providerId,
    required this.name,
    required this.style,
    this.textAlign = TextAlign.start,
    this.maxLines = 2,
    this.enableHero = true,
  });

  final String providerId;
  final String name;
  final TextStyle? style;
  final TextAlign textAlign;
  final int maxLines;
  final bool enableHero;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      name,
      textAlign: textAlign,
      style: style,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );

    if (!enableHero) return text;

    return Hero(
      tag: ProviderHeroTags.name(providerId),
      child: Material(
        type: MaterialType.transparency,
        child: text,
      ),
    );
  }
}
