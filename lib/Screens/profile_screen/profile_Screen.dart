import 'package:deneme/Screens/profile_screen/Buttons_screens/profile_info.dart';
import 'package:deneme/Screens/profile_screen/Widget/profile_button.dart';
import 'package:deneme/model/constans.dart';

import 'package:deneme/cubit/user_cubit.dart';
import 'package:deneme/model/sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final SignInModel user;

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUser();

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is GetUserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetUserSuccess) {
            final userData = state.userData;
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ImageAndUserNameWidget(
                    text: userData.data?.name ?? "Unknown",
                    imageUrl: userData.data?.image?.url ?? '',
                  ),
                  const SizedBox(height: 40),
                  ProfileButton(
                    text: "Profile Info",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileInfo(
                            userName: userData.data?.name ?? "Unknown",
                            phoneNumber: userData.data?.phone ?? "Unknown",
                            whatsappNumber: userData.data?.whatsapp ?? "Unknown",
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state is GetUserFailure) {
            return Center(child: Text(state.errMessage));
          } else {
            return Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}

class ImageAndUserNameWidget extends StatelessWidget {
  const ImageAndUserNameWidget({super.key, required this.text, required this.imageUrl});
  final String text;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: imageUrl.isNotEmpty
            ? NetworkImage(imageUrl)
            : AssetImage("assets/images/avatar.png") as ImageProvider,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: ButtonsColor,
        ),
      ),
    );
  }
}
