import 'package:flutter/material.dart';

class ErrorModel {
  ErrorModel({
    @required this.message,
    this.errorCode,
    this.statusCode,
    this.exception,
  });

  String message;
  int errorCode;
  int statusCode;
  Exception exception;
}
