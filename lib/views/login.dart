// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:learning_flutter/constants/routes.dart';
import 'package:learning_flutter/utils/common.dart';
import 'dart:developer' as developer show log;

import 'package:learning_flutter/utils/request.dart';
import 'package:learning_flutter/utils/text_form_field.dart';
import 'package:learning_flutter/views/banner.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late bool _passwordVisible;
  late bool _loading;

  @override
  void initState() {
    _email = TextEditingController(text: 'seller@gmail.com');
    _password = TextEditingController(text: '12345678');
    _passwordVisible = false;
    _loading = false;
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  void onSubmit(BuildContext context) async {
    if (!_formKey.currentState!.validate()) return;
    setLoader(true);
    await Future.delayed(const Duration(seconds: 2));
    try {
      await request(
        "auth/login/seller",
        method: "POST",
        body: {
          "email": _email.text,
          "password": _password.text,
        },
      );
      replaceScreen(context, dashboardRoute);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setLoader(false);
    }
  }

  void togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void setLoader(bool flag) {
    setState(() {
      _loading = flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Column(
          children: [
            getAuthScreenBanner(),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Sign In As a Buyer',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    InputFieldWidget(
                      context: context,
                      controller: _email,
                      label: "Email",
                      validator: (fieldValue) {
                        final value = fieldValue!;
                        if (value.isEmpty) {
                          return 'Please enter your email address';
                        } else if (!RegExp(emailRegex).hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    InputFieldWidget(
                      context: context,
                      controller: _password,
                      label: "Password",
                      isPassword: true,
                      validator: (fieldValue) => fieldValue!.isEmpty
                          ? 'Please enter your password'
                          : null,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          replaceScreen(context, forgotPassRoute);
                        },
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: 'FF1059CA'.toColor(),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => onSubmit(context),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateColor.resolveWith(
                            (_) => 'FFC1E290'.toColor(),
                          ),
                          foregroundColor: MaterialStateColor.resolveWith(
                            (_) => Colors.black,
                          ),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        child: _loading
                            ? Transform.scale(
                                scale: 0.5,
                                child: const CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : const Text('Log In'),
                      ),
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
