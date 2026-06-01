import 'package:flutter/material.dart';

/// Maps localized category labels to a distinct icon for list cards.
IconData categoryIconFor(String category) {
  final key = category.toLowerCase();

  if (_matches(key, ['cardio', 'kalp'])) {
    return Icons.favorite_rounded;
  }
  if (_matches(key, ['dent', 'diş'])) {
    return Icons.emoji_emotions_outlined;
  }
  if (_matches(key, ['pediat', 'çocuk'])) {
    return Icons.child_care_rounded;
  }
  if (_matches(key, ['dermat', 'cilt'])) {
    return Icons.spa_rounded;
  }
  if (_matches(key, ['ortho', 'ortoped'])) {
    return Icons.accessibility_new_rounded;
  }
  if (_matches(key, ['gynec', 'kadın'])) {
    return Icons.female_rounded;
  }
  if (_matches(key, ['psych', 'psikiy'])) {
    return Icons.psychology_alt_rounded;
  }
  if (_matches(key, ['physio', 'fizik'])) {
    return Icons.self_improvement_rounded;
  }
  if (_matches(key, ['general', 'aile', 'practice'])) {
    return Icons.medical_information_outlined;
  }
  if (_matches(key, ['ophthal', 'göz'])) {
    return Icons.visibility_rounded;
  }
  if (_matches(key, ['ent', 'kulak', 'burun', 'boğaz'])) {
    return Icons.hearing_rounded;
  }
  if (_matches(key, ['tech', 'teknoloji'])) {
    return Icons.memory_rounded;
  }
  if (_matches(key, ['legal', 'hukuk'])) {
    return Icons.gavel_rounded;
  }
  if (_matches(
      key, ['health', 'sağlık', 'hospital', 'hastane', 'clinic', 'klinik'])) {
    return Icons.local_hospital_rounded;
  }

  return Icons.medical_services_outlined;
}

bool _matches(String key, List<String> needles) {
  for (final needle in needles) {
    if (key.contains(needle)) return true;
  }
  return false;
}
