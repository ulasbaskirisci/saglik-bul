import 'package:flutter/material.dart';

class DetailStarRating extends StatelessWidget {
  const DetailStarRating({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fullStars = rating.floor().clamp(0, 5);
    final cs = theme.colorScheme;

    return Row(
      children: List.generate(5, (index) {
        final filled = index < fullStars;
        return Icon(
          filled ? Icons.star_rounded : Icons.star_outline_rounded,
          size: 16,
          color: filled
              ? const Color(0xFFE6A800)
              : cs.outlineVariant.withValues(alpha: 0.8),
        );
      }),
    );
  }
}
