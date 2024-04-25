import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:shopsmart_user/consts/validator.dart';
import 'package:shopsmart_user/screens/auth/register_screen.dart';
import 'package:shopsmart_user/screens/root_screen.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../widgets/app_name_text.dart';
import '../../widgets/google_button.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/LoginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _emailController.dispose();
      _passwordController.dispose();
      //focus node
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _loginFct() async {
    final isValid = _formkey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(
                height: 60,
              ),
              const AppNameTextWidget(
                fontSize: 40,
              ),
              const SizedBox(
                height: 15,
              ),
              const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: TitlesTextWidget(label: "Welcome Back!")),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SubtitleTextWidget(
                            label:
                                "Your One-Stop Shop for Smart Savings and Seamless Shopping!"),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "admin@gmail.com",
                              prefixIcon: Icon(IconlyLight.message),
                            ),
                            onFieldSubmitted: (value) {
                              FocusScope.of(context)
                                  .requestFocus(_passwordFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.emailValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            obscureText: obscureText,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: "*************",
                              prefixIcon: const Icon(IconlyLight.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText;
                                    });
                                  },
                                  icon: Icon(obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                            onFieldSubmitted: (value) async {
                              _loginFct();
                            },
                            validator: (value) {
                              return MyValidators.passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, ForgotPasswordScreen.routeName);
                                },
                                child: const SubtitleTextWidget(
                                  label: "Forgot Password?",
                                  fontStyle: FontStyle.italic,
                                  textDecoration: TextDecoration.underline,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(12),
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  )),
                              icon: const Icon(Icons.login),
                              label: const Text(
                                "Login",
                                style: TextStyle(fontSize: 17),
                              ),
                              onPressed: () async {
                                await _loginFct();
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SubtitleTextWidget(label: "Or Signup with"),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const GoogleButton(),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(12),
                                    backgroundColor: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    )),
                                label: const Text(
                                  "Signup as Guest",
                                  style: TextStyle(fontSize: 12),
                                ),
                                onPressed: () async {
                                  Navigator.pushNamed(
                                      context, RootScreen.routeName);
                                },
                                icon: const Icon(Icons.person),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SubtitleTextWidget(
                                  label: "Don't have an Account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.routeName);
                                  },
                                  child: const SubtitleTextWidget(
                                    label: "Signup",
                                    fontStyle: FontStyle.italic,
                                    textDecoration: TextDecoration.underline,
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
