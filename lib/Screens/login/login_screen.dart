import 'package:deneme/Screens/profile_screen/profile_Screen.dart';
import 'package:deneme/Widget/TextFilld-widget.dart';
import 'package:deneme/Widget/login-signup-button.dart';
import 'package:deneme/cubit/user_cubit.dart';

import 'package:deneme/model/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    final userCubit = context.read<UserCubit>();

    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("succsess")));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(user: state.user,
                   
                  ),
                ));
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: userCubit.formKey, // استخدام المفتاح من Cubit
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight * 0.1),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                          prefixIcon: Icon(Icons.email),
                          TextMessage: 'Email is Wrong You must write.com',
                          hitText: 'Write your Email',
                          controller: userCubit
                              .emailController, // استخدام المتحكم من Cubit
                          obscureText: false,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                          prefixIcon: Icon(Icons.password),
                          TextMessage:
                              'Password should contain at least 1 special character,the length should be  between 6 to 16  character',
                          hitText: 'Write your Password',
                          controller: userCubit
                              .passwordController, // استخدام المتحكم من Cubit
                          obscureText: true,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  side: BorderSide(color: Colors.black12),
                                  value: rememberMe,
                                  onChanged: (bool? newValue) {
                                    setState(() {
                                      rememberMe = newValue ?? false;
                                    });
                                  },
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(color: Colors.black26),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/ForgetPasswordScreen');
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: ButtonsColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        state is SignInLoading
                            ? const CircularProgressIndicator()
                            : MyButton(
                                color: ButtonsColor,
                                onPressed: () {
                                  if (userCubit.formKey.currentState
                                          ?.validate() ??
                                      false) {
                                    userCubit.signIn();
                                  }
                                },
                                title: "Send",
                              ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don’t have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/SignUp');
                              },
                              child: Text('Sign up'),
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
