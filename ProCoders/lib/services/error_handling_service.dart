import 'dart:async';

import '../models/error_model.dart';

mixin ErrorHandlingService {

  static ErrorModel _error;
  static final StreamController<ErrorModel> _errorController = StreamController<ErrorModel>.broadcast();

  static ErrorModel get error => _error;
  static Stream<ErrorModel> get onError => _errorController.stream;

  static Future<ErrorModel> setError(ErrorModel error) async {
    if (error != _error) {
      _error = error;

      _errorController.add(_error);
    }
    return _error;
  }

  static Future<void> clearError() async {
    _error = null;
  }
}