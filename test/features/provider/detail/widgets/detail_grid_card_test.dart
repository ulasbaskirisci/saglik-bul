import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider_search/features/provider/detail/widgets/detail_grid_card.dart';

void main() {
  testWidgets('DetailGridCard displays label and value', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 160,
            child: DetailGridCard(
              icon: Icons.phone_in_talk_rounded,
              label: 'Phone',
              value: '+90 312 555 0101',
            ),
          ),
        ),
      ),
    );

    expect(find.text('Phone'), findsOneWidget);
    expect(find.text('+90 312 555 0101'), findsOneWidget);
  });

  testWidgets('DetailGridCard invokes onTap when tappable', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 200,
            height: 180,
            child: DetailGridCard(
              icon: Icons.mail_outline_rounded,
              label: 'Email',
              value: 'info@example.com',
              emphasize: true,
              onTap: () => tapped = true,
              footer: const Text('Send email'),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(DetailGridCard));
    await tester.pump();

    expect(tapped, isTrue);
    expect(find.text('Send email'), findsOneWidget);
  });
}
