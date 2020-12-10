import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../../models/error_model.dart';
import '../../services/error_handling_service.dart';

import '../exceptions.dart';

class ErrorInterceptor implements InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }

  @override
  Future onError(DioError err) async {
    final Response response = err.response;

    ErrorModel error;

    String getMessage(String prodMessage, String nonProdMessage) {
      return kReleaseMode ? prodMessage : nonProdMessage;
    }

    if (response?.statusCode != null) {
      switch (response.statusCode) {
        case 302:
          final message = getMessage(
              'We experienced an issue redirecting.',
              response.headers['location'].toString(),
            );
          error = ErrorModel(
            message: message,
            exception: RedirectException(message),
          );
          break;
        case 400:
          final message = getMessage(
              'There was an issue with the data provided',
              response.data['Message']?.toString() ?? '',
            );
          error = ErrorModel(
            message: message,
            exception: BadRequestException(message),
          );
          break;
        case 401:
          final message = getMessage(
            'User unauthorized.',
            response.data['Message']?.toString() ?? '',
          );
          error = ErrorModel(
            message: message,
            exception: UnauthorisedException(message),
          );
          break;
        case 404:
          final message = getMessage(
            'Destination was not found.',
            response.data['Message']?.toString() ?? '',
          );
          error = ErrorModel(
            message: message,
            exception: NotFoundException(message),
          );
          break;
        case 409:
          final message = getMessage(
            'Error occurred while Communication with Server',
            response.data['Message']?.toString() ?? '',
          );
          error = ErrorModel(
            message: message,
            exception: NotFoundException(message),
          );
          break;  
        case 500:
          final message = getMessage(
              'An unexpected error occurred, please try again later',
              response.data['Message']?.toString() ?? '',);
          error = ErrorModel(
            message: message,
            exception: ServerException(message),
          );
          break;
        default:
          final message = 'Error occurred while Communication with Server with StatusCode : ${response.statusCode}';
          error = ErrorModel(
            message: message,
            exception: FetchDataException(message),
          );
      }
    } else {
      final message = getMessage(
        'Unexpected event occurred due to possible timeout.',
        response.data['Message']?.toString() ?? '',
      );
          error = ErrorModel(
            message: message,
            exception: BadRequestException(message),
          );

      debugPrint(err.toString());
    }

    ErrorHandlingService.setError(error);
    throw error.exception;
  }
}
