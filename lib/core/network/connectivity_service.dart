/// Abstraction for connectivity checks — swap with `connectivity_plus` in production.
abstract class ConnectivityService {
  Future<bool> get isOnline;
}

/// Mock implementation for the case study; toggle [online] to demo offline flows.
class MockConnectivityService implements ConnectivityService {
  MockConnectivityService({this.online = true});

  bool online;

  @override
  Future<bool> get isOnline async => online;
}
