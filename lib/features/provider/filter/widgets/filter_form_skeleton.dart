import 'package:flutter/material.dart';

class FilterFormSkeleton extends StatelessWidget {
  const FilterFormSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHighest;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        for (var i = 0; i < 3; i++) ...[
          Container(
            height: 72,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
