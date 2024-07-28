import 'package:deneme/core/api/end_points.dart';

class SignInModel {
  final String token;


  SignInModel({

    required this.token,

  });

  factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
    return SignInModel(
      token: jsonData[ApiKey.token],

    );
  }
}
