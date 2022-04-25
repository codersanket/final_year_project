import 'package:freezed_annotation/freezed_annotation.dart';

class Failure {
  final String errorCode;
  final String? errorMessage;

  Failure({required this.errorCode, required this.errorMessage});
}
