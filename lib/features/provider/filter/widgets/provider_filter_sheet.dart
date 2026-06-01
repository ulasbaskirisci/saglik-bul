import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'filter_sheet_body.dart';

Future<void> showProviderFilterSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: 0.5),
    builder: (context) => const ProviderFilterSheet(),
  );
}

class ProviderFilterSheet extends ConsumerWidget {
  const ProviderFilterSheet({super.key});

  static const maxSheetWidth = 560.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewInsets = MediaQuery.viewInsetsOf(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final sheetWidth =
        screenWidth > maxSheetWidth + 32 ? maxSheetWidth : screenWidth;

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets.bottom),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: sheetWidth,
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: screenWidth > 600 ? 0.52 : 0.65,
            minChildSize: 0.38,
            maxChildSize: 0.92,
            builder: (context, scrollController) {
              return Material(
                clipBehavior: Clip.antiAlias,
                elevation: 16,
                shadowColor: Colors.black.withValues(alpha: 0.22),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: FilterSheetBody(scrollController: scrollController),
              );
            },
          ),
        ),
      ),
    );
  }
}
