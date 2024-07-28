import 'package:deneme/Widget/TextFilld-widget.dart';
import 'package:deneme/Widget/login-signup-button.dart';
import 'package:deneme/model/constans.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nwepassword = TextEditingController();
  final _repeatpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // ignore: unused_local_variable
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    child: Text(
                      'New password',
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
                          'New Password',
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
                      hitText: 'Write your password',
                      obscureText: false,
                      controller: _nwepassword,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Repeat Password',
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
                      hitText: 'Write your password',
                      obscureText: false,
                      controller: _repeatpassword,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    MyButton(
                      color: ButtonsColor,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
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
