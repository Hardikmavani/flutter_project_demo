// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_project_demo/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isShowPassword = false;
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/login_image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 25),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            // print(value);
                            if (value!.isEmpty) {
                              return "Please Enter Valid Email";
                            } else if (!RegExp(r'\S+@\S+\.\S+')
                                .hasMatch(value)) {
                              return "Please Enter a Valid Email";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: 'Enter Username',
                              label: Text('Username')),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value.length < 8) {
                              return 'Password length should be atleast 8';
                            }
                            return null;
                          },
                          obscureText: isShowPassword,
                          decoration: InputDecoration(
                              suffixIcon: InkWell(
                                  onTap: () {
                                    isShowPassword = !isShowPassword;
                                    setState(() {});
                                  },
                                  child: Icon(isShowPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined)),
                              hintText: 'Enter Password',
                              label: const Text('Password')),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
