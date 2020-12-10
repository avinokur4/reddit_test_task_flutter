import '../repositories/network_exception.dart';

class FetchDataException extends NetworkException {
  FetchDataException([String message])
      : super(message, 'Error During Communication: ');
}

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, 'Invalid Request: ');
}

class RedirectException extends NetworkException {
  RedirectException([message]) : super(message, 'Redirected: ');
}

class UnauthorisedException extends NetworkException {
  UnauthorisedException([message]) : super(message, 'Unauthorised: ');
}

class NotFoundException extends NetworkException {
  NotFoundException([message]) : super(message, 'Not Found: ');
}

class ServerException extends NetworkException {
  ServerException([message]) : super(message, 'Error from backend: ');
}
