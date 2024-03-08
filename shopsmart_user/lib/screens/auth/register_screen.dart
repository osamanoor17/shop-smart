import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopsmart_user/consts/validator.dart';
import 'package:shopsmart_user/widgets/subtitle_text.dart';
import 'package:shopsmart_user/widgets/title_text.dart';

import '../../services/myapp_functions.dart';
import '../../widgets/app_name_text.dart';
import '../../widgets/image_picker_widget.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _repeatpasswordController;

  late final FocusNode _nameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _repeatpasswordFocusNode;
  final _formkey = GlobalKey<FormState>();
  XFile? _pickedImage;
  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _repeatpasswordController = TextEditingController();

    _nameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatpasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      _nameController.dispose();
      _emailController.dispose();
      _passwordController.dispose();
      _repeatpasswordController.dispose();
      //focus node
      _nameFocusNode.dispose();
      _emailFocusNode.dispose();
      _passwordFocusNode.dispose();
      _repeatpasswordFocusNode.dispose();
    }
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = _formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
  }

  Future<void> localImagePicker() async {
    final ImagePicker imagePicker = ImagePicker();
    await MyAppFunctions.imagePickerDialog(
        context: context,
        cameraFCT: () async {
          _pickedImage =
              await imagePicker.pickImage(source: ImageSource.camera);
          setState(() {});
        },
        galleryFCT: () async {
          _pickedImage =
              await imagePicker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        removeFCT: () {
          setState(() {
            _pickedImage = null;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              const AppNameTextWidget(
                fontSize: 40,
              ),
              // const SizedBox(
              //   height: 30,
              // ),
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
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SubtitleTextWidget(
                            label:
                                "Your One-Stop Shop for Smart Savings and Seamless Shopping!"),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: size.width * 0.4,
                  width: size.width * 0.4,
                  child: PickImageWidget(
                    pickedImage: _pickedImage,
                    function: () async {
                      await localImagePicker();
                    },
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _nameController,
                            focusNode: _nameFocusNode,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              hintText: "Full Name",
                              prefixIcon: Icon(Icons.person),
                            ),
                            onFieldSubmitted: (value) {
                              Focus.of(context).requestFocus(_emailFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.displayNamevalidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
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
                              Focus.of(context)
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
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: "password",
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
                            onFieldSubmitted: (value) {
                              Focus.of(context)
                                  .requestFocus(_repeatpasswordFocusNode);
                            },
                            validator: (value) {
                              return MyValidators.passwordValidator(value);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _repeatpasswordController,
                            focusNode: _repeatpasswordFocusNode,
                            obscureText: obscureText,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: "re-type password",
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
                              _registerFct();
                            },
                            validator: (value) {
                              return MyValidators.repeatPasswordValidator(
                                  value: value,
                                  password: _passwordController.text);
                            },
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
                              icon: const Icon(IconlyLight.addUser),
                              label: const Text(
                                "Signup",
                                style: TextStyle(fontSize: 17),
                              ),
                              onPressed: () async {
                                await _registerFct();
                              },
                            ),
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
