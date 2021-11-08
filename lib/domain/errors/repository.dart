class RepositoryExeption implements Exception {
  RepositoryExeption({
    required this.reason,
    required this.statucCode,
    this.platform = 'web',
  });
  final String reason;
  final int statucCode;
  final String platform;

  @override
  String toString() {
    return reason;
  }
}
