import 'package:create_app/View/Screens/home_screen.dart';
import 'package:create_app/View/Widgets/common_widgets.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(
                        'assets/images/create.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const CustomText(
                      text: 'CREATE',
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  ],
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              color: Colors.blue,
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(
                      hint: 'USERNAME',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Enter a username';
                        } else if (value.trim().length < 3) {
                          return 'Username must be have at least 3 characters long';
                        } else {
                          return null;
                        }
                      },
                    ),
                    CustomTextField(
                      hint: 'PASSWORD',
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Please enter a password';
                        } else if (value.trim().length < 6) {
                          return 'Password must be have at least 6 characters long';
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        // Login with facebook
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 30)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: const BorderSide(
                                  width: 2,
                                  color: Colors.white,
                                )),
                          )),
                      child: const CustomText(text: 'LOGIN WITH FACEBOOK'),
                    ),
                    TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        }
                      },
                      child: const CustomText(text: 'SIGN UP'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
