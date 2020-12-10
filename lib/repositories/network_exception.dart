class NetworkException implements Exception {
  NetworkException([this._message, this._prefix]);
  
  final dynamic _message;
  final String _prefix;

  @override
  String toString() {
    return '$_prefix$_message';
  }
}