// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:learning_flutter/constants/routes.dart';
import 'package:learning_flutter/utils/common.dart';
import 'package:learning_flutter/utils/text_form_field.dart';

import 'package:learning_flutter/views/banner.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController(text: 'seller@gmail.com');
    _password = TextEditingController(text: '12345678');
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

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
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Enter registered email address to change your password.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: 'FF272B41'.toColor(),
                        ),
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
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // empty
                          }
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(6),
                              ),
                            ),
                          ),
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => 'FFC1E290'.toColor(),
                          ),
                          foregroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black,
                          ),
                          textStyle: MaterialStateProperty.all(
                            const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        child: const Text('Reset Password'),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          replaceScreen(context, loginRoute);
                        },
                        child: Text(
                          '< Back to Sign In',
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
