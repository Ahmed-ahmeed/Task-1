import 'package:deneme/core/errors/api_error.dart';

class SignUpModel {
  final String status;
  final List<ApiError> errors;

  SignUpModel({
    required this.status,
    required this.errors,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    var errorsList = json['errors'] as List;
    List<ApiError> errors = errorsList.map((error) => ApiError.fromJson(error)).toList();

    return SignUpModel(
      status: json['status'],
      errors: errors,
    );
  }
}
