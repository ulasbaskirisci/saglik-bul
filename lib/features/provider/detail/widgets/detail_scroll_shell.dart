import 'package:flutter/material.dart';

/// App bar + scroll area for detail loading, error, and not-found states.
class DetailScrollShell extends StatelessWidget {
  const DetailScrollShell({
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final minHeight = MediaQuery.sizeOf(context).height * 0.55;

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          leading: const BackButton(),
          title: Text(title),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: minHeight,
            child: child,
          ),
        ),
      ],
    );
  }
}
