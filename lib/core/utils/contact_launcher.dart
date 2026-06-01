import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> launchPhone(BuildContext context, String phone) async {
  final normalized = phone.replaceAll(RegExp(r'\s+'), '');
  final uri = Uri(scheme: 'tel', path: normalized);
  return _launch(context, uri);
}

Future<bool> launchEmail(BuildContext context, String email) async {
  final uri = Uri(scheme: 'mailto', path: email);
  return _launch(context, uri);
}

Future<bool> _launch(BuildContext context, Uri uri) async {
  try {
    if (!await canLaunchUrl(uri)) {
      return false;
    }
    return await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (_) {
    return false;
  }
}

void showLaunchErrorSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Text(message),
    ),
  );
}
