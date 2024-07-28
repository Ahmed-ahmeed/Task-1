import 'package:deneme/core/api/api_consumer.dart';
import 'package:deneme/core/api/end_points.dart';
import 'package:deneme/core/errors/exceptions.dart';
import 'package:deneme/core/functions/upload_image_to_api.dart';
import 'package:deneme/model/sign_in_model.dart';
import 'package:deneme/model/get_user.dart';
import 'package:deneme/model/update_user.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.api) : super(UserInitial());
  final ApiConsumer api;

  // Sign in
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Sign Up
  XFile? profilepic;
  final GlobalKey<FormState> formKeyy = GlobalKey<FormState>();
  final TextEditingController signUpname = TextEditingController();
  final TextEditingController signUpemail = TextEditingController();
  final TextEditingController signUppassword = TextEditingController();
  final TextEditingController signUpphoneNumber = TextEditingController();
  final TextEditingController signUpWhatsAppphoneNumber =
      TextEditingController();
  final nameController = TextEditingController();
  String? selectedGender;

  // Forget Password
  final GlobalKey<FormState> forgetformKey = GlobalKey<FormState>();
  final TextEditingController fogetPassword = TextEditingController();
  SignInModel? user;

  signUp() async {
    if (formKeyy.currentState?.validate() ?? false) {
      if (profilepic == null) {
        emit(SignUpFailure(errMessage: 'Please select a profile picture'));
        return;
      }

      try {
        emit(SignUpLoading());

        MultipartFile imageFile = await uploadImageToAPI(profilepic!);

        final formData = FormData.fromMap({
          ApiKey.name: signUpname.text,
          ApiKey.email: signUpemail.text,
          ApiKey.phone: signUpphoneNumber.text,
          ApiKey.password: signUppassword.text,
          ApiKey.gender: selectedGender,
          ApiKey.whatsapp: signUpWhatsAppphoneNumber.text,
          ApiKey.image: imageFile,
        });

        final response = await api.post(
          EndPoint.signUp,
          data: formData,
          options: Options(
            headers: {
              'Content-Type': 'multipart/form-data',
            },
          ),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(SignUpSuccess());
        } else {
          emit(SignUpFailure(
              errMessage:
                  response.data['message'] ?? 'Unknown error occurred'));
        }
      } on SereverException catch (e) {
        emit(SignUpFailure(errMessage: e.errModel.message));
      }
    } else {
      emit(SignUpFailure(errMessage: 'Please fill in all fields correctly'));
    }
  }

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await api.post(
        EndPoint.signIn,
        data: {
          ApiKey.email: emailController.text,
          ApiKey.password: passwordController.text,
        },
      
      );
      user = SignInModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      print(decodedToken['userId']);

      emit(SignInSuccess(user: user!));
    } on SereverException catch (e) {
      emit(SignInFailure(errMessage: e.errModel.message));
    }
  }

  void uploadProfilePic(XFile image) {
    profilepic = image;
    emit(UploadProfilePic());
  }

  getUser() async {
    try {
      emit(GetUserLoading());
      final response = await api.get(
        EndPoint.getData,
        options: Options(
          headers: {
            'Authorization': 'Bearer ${user?.token}',
          },
        ),
      );

      final responseData = response as Map<String, dynamic>;

      final userData = getData.fromJson(responseData);

      emit(GetUserSuccess(userData: userData));
    } on SereverException catch (e) {
      emit(GetUserFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(GetUserFailure(errMessage: e.toString()));
    }
  }

  updateUser(
      {required String name,
      required String phone,
      required String whatsapp}) async {
    try {
      emit(UpdateUserLoading());
       print("Token: ${user?.token}");

      final response = await api.patch(EndPoint.updateMe,
          data: {
            ApiKey.name: name,
            ApiKey.phone: phone,
            ApiKey.whatsapp: whatsapp,
          },
         );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(UpdateUserSuccess());
      } else {
        emit(UpdateUserFailure(
            errMessage: response.data['message'] ?? 'Unknown error occurred'));
      }
    } on SereverException catch (e) {
      emit(UpdateUserFailure(errMessage: e.errModel.message));
    } catch (e) {
      emit(UpdateUserFailure(errMessage: e.toString()));
    }
  }
}
