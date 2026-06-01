import 'package:flutter/material.dart';

import '../../../../core/utils/contact_launcher.dart';
import '../../../../data/models/provider_profile.dart';
import '../../../../l10n/app_localizations.dart';
import 'detail_action_chip.dart';
import 'detail_empty_contact_card.dart';
import 'detail_grid_card.dart';

class DetailContactGrid extends StatelessWidget {
  const DetailContactGrid({super.key, required this.profile});

  final ProviderProfile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    if (profile.phone == null && profile.email == null) {
      return DetailEmptyContactCard(message: l10n.contactUnavailable);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final hasBoth = profile.phone != null && profile.email != null;
        final crossAxisCount = hasBoth && constraints.maxWidth > 400 ? 2 : 1;
        const spacing = 12.0;
        final itemWidth = crossAxisCount == 2
            ? (constraints.maxWidth - spacing) / 2
            : constraints.maxWidth;

        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            if (profile.phone != null)
              SizedBox(
                width: itemWidth,
                height: 160,
                child: DetailGridCard(
                  icon: Icons.phone_in_talk_rounded,
                  label: l10n.phone,
                  value: profile.phone!,
                  emphasize: true,
                  onTap: () => _call(context, profile.phone!),
                  footer: DetailActionChip(label: l10n.callAction),
                ),
              ),
            if (profile.email != null)
              SizedBox(
                width: itemWidth,
                height: 160,
                child: DetailGridCard(
                  icon: Icons.mail_outline_rounded,
                  label: l10n.email,
                  value: profile.email!,
                  emphasize: true,
                  onTap: () => _email(context, profile.email!),
                  footer: DetailActionChip(label: l10n.emailAction),
                ),
              ),
          ],
        );
      },
    );
  }

  Future<void> _call(BuildContext context, String phone) async {
    final l10n = AppLocalizations.of(context)!;
    final ok = await launchPhone(context, phone);
    if (!ok && context.mounted) {
      showLaunchErrorSnackBar(context, l10n.launchContactError);
    }
  }

  Future<void> _email(BuildContext context, String email) async {
    final l10n = AppLocalizations.of(context)!;
    final ok = await launchEmail(context, email);
    if (!ok && context.mounted) {
      showLaunchErrorSnackBar(context, l10n.launchContactError);
    }
  }
}
