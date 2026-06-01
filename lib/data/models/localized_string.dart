/// Bilingual field for mock data (EN / TR).
class LocalizedString {
  const LocalizedString({required this.en, required this.tr});

  final String en;
  final String tr;

  String resolve(String languageCode) {
    if (languageCode == 'tr') return tr;
    return en;
  }
}
