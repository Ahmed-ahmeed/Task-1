import 'package:deneme/Widget/TextFilld-widget.dart';
import 'package:deneme/Widget/login-signup-button.dart';
import 'package:deneme/cubit/user_cubit.dart';
import 'package:deneme/model/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
        final userCubit = context.read<UserCubit>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: userCubit.forgetformKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      'Forget password',
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
                      obscureText: false,
                      controller: userCubit.fogetPassword,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    MyButton(
                      color: ButtonsColor,
                      onPressed: () {
                        if (userCubit.forgetformKey.currentState?.validate() ?? false) {
                          Navigator.pushNamed(context, '/NewPassworsScreen');
                          // إذا كانت جميع الحقول صالحة، يمكنك هنا معالجة البيانات المدخلة
                        }
                      },
                      title: "Send",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
