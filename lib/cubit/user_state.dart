part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class SignInSuccess extends UserState {
  final SignInModel user;

  SignInSuccess({required this.user});
}

final class UploadProfilePic extends UserState {}

final class SignInLoading extends UserState {}

final class SignInFailure extends UserState {
  final String errMessage;

  SignInFailure({required this.errMessage});
}

final class SignUpSuccess extends UserState {}

final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}

class GetUserSuccess extends UserState {
  final getData userData;
  GetUserSuccess({required this.userData});
}

class GetUserLoading extends UserState {}

class GetUserFailure extends UserState {
  final String errMessage;
  GetUserFailure({required this.errMessage});
}

final class UpdateUserLoading extends UserState {}

final class UpdateUserSuccess extends UserState {

}

final class UpdateUserFailure extends UserState {
  final String errMessage;
  UpdateUserFailure({required this.errMessage});
}
