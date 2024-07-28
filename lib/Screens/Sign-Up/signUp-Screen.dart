import 'package:deneme/Widget/DropDown.dart';
import 'package:deneme/Widget/login-signup-button.dart';
import 'package:deneme/Widget/pic_image_widget.dart';
import 'package:deneme/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:deneme/Widget/TextFilld-widget.dart';
import 'package:deneme/model/constans.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    final userCubit = context.read<UserCubit>();
    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
            if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Succsess")));
          }else if(state is SignInFailure){
             ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: userCubit.formKeyy,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.04),
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const PickImageWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'Full Name',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFieldStyle(
                          TextMessage: 'Please Your Name',
                          hitText: 'Write your First Name',
                          controller: userCubit.signUpname,
                          obscureText: false,
                          prefixIcon: const Icon(Icons.near_me),
                        ),
                        SizedBox(height: screenHeight * 0.009),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFieldStyle(
                          TextMessage: 'Email is Wrong You must write .com',
                          hitText: 'Write your Email',
                          controller: userCubit.signUpemail,
                          obscureText: false,
                          prefixIcon:const Icon(Icons.email),
                        ),
                       const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: "Male",
                                  groupValue: userCubit.selectedGender,
                                  onChanged: (String? val) {
                                    setState(() {
                                      userCubit.selectedGender = val;
                                    });
                                  },
                                ),
                                const Text('Male'),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: "Female",
                                  groupValue: userCubit.selectedGender,
                                  onChanged: (String? val) {
                                    setState(() {
                                      userCubit.selectedGender = val;
                                    });
                                  },
                                ),
                                const Text('Female'),
                              ],
                            ),
                          ],
                        ),
                      const  Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        TextFieldStyle(
                          prefixIcon:const Icon(Icons.password),
                          TextMessage:
                              'Password should contain at least 1 special character,the length should be  between 6 to 16  character',
                          hitText: 'Write your Password',
                          controller: userCubit.signUppassword,
                          obscureText: true,
                        ),
                       const Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'Phone number',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: CountryDropdown(),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFieldStyle(
                                prefixIcon:const Icon(Icons.phone),
                                TextMessage: 'Plase Write your phone number',
                                hitText: '+ 20',
                                controller: userCubit.signUpphoneNumber,
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                      const  Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 3.0),
                            child: Text(
                              'What’s app number',
                              style: TextStyle(
                                fontSize: 17,
                                color: TextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 0,
                              child: CountryDropdown(),
                            ),
                            Expanded(
                              flex: 1,
                              child: TextFieldStyle(
                                prefixIcon:const Icon(Icons.phone),
                                TextMessage: 'Plase Write your phone number',
                                hitText: '+ 20',
                                controller: userCubit.signUpWhatsAppphoneNumber,
                                obscureText: true,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              side: const BorderSide(color: Colors.black),
                              value: rememberMe,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  rememberMe = newValue ?? false;
                                });
                              },
                            ),
                          const  Text(
                              'I accepted privacy and security ',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        state is SignUpLoading
                            ? const CircularProgressIndicator()
                            : MyButton(
                                color: ButtonsColor,
                                onPressed: () {
                                  if (userCubit.formKeyy.currentState
                                          ?.validate() ??
                                      false) {
                                    userCubit.signUp();
                                  }
                                },
                                title: "Send",
                              ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                         const   Text('Have account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child:const Text('Login'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
