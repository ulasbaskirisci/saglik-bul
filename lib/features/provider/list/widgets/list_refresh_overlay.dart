import 'package:flutter/material.dart';

/// Centered loading overlay while the list reloads (e.g. locale change, refresh).
class ListRefreshOverlay extends StatelessWidget {
  const ListRefreshOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Positioned.fill(
      child: IgnorePointer(
        child: ColoredBox(
          color: theme.colorScheme.surface.withValues(alpha: 0.72),
          child: Center(
            child: Material(
              elevation: 3,
              shadowColor: theme.colorScheme.shadow.withValues(alpha: 0.15),
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: SizedBox(
                  width: 32,
                  height: 32,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
