/// Mock-only gate for offline demo (case study bonus).
abstract class OfflineSimulator {
  Future<bool> get isAvailable;
}

class MockOfflineSimulator implements OfflineSimulator {
  MockOfflineSimulator({this.isOnline = true});

  bool isOnline;

  @override
  Future<bool> get isAvailable async => isOnline;
}
