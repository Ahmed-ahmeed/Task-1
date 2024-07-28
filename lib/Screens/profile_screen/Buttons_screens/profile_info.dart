import 'package:deneme/Screens/profile_screen/Widget/user_editing.dart';
import 'package:deneme/Widget/login-signup-button.dart';
import 'package:deneme/cubit/user_cubit.dart';
import 'package:deneme/model/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String phoneNumber;
  final String whatsappNumber;

  ProfileInfo({
    super.key,
    required this.userName,
    required this.phoneNumber,
    required this.whatsappNumber,
  });

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: PickImageWidget()),
              const SizedBox(height: 20),
              UserEditing(
                text: userName,
                title: "Name",
                controller: _nameController,
              ),
              const SizedBox(height: 10),
              UserEditing(
                text: '*******',
                title: "Password",
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              UserEditing(
                text: phoneNumber,
                title: "Phone Number",
                controller: _phoneController,
              ),
              const SizedBox(height: 10),
              UserEditing(
                text: whatsappNumber,
                title: "What's app Number",
                controller: _whatsappController,
              ),
              const SizedBox(height: 10),
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state) {
                  if (state is UpdateUserSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Profile updated successfully')),
                    );
                    Navigator.pop(context);
                  } else if (state is UpdateUserFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errMessage)),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is UpdateUserLoading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return MyButton(
                    color: ButtonsColor,
                    title: "Save change",
                    onPressed: () {
                      if (_nameController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty &&
                          _whatsappController.text.isNotEmpty) {
                        final userCubit = context.read<UserCubit>();
                        userCubit.updateUser(
                          name: _nameController.text,
                          phone: _phoneController.text,
                          whatsapp: _whatsappController.text,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please fill in all fields')),
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white54,
      ),
      width: 100,
      height: 100,
      child: const Icon(Icons.person, size: 50),
    );
  }
}
