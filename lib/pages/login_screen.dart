import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
// import '../pages/signup_screen.dart';
import '../utils/mytheme.dart';
import '../utils/social_buttons.dart';
import 'package:libmanagement/services/functions/authFunctions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  // final emailController = TextEditingController();
  // final passwordController = TextEditingController();
  final forgotEmailController = TextEditingController();
  String nameController = '';
  String emailController = '';
  String passwordController = '';
  String cnfPasswordController = '';
  bool login = false;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      backgroundColor: MyTheme.splash,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Container(
          color: Colors.transparent,
          height: _size.height,
          width: _size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ========= banner ==========
              SvgPicture.asset("assets/icons/splash_icon.svg"),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Welcome Buddies,",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: _size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    login
                        ? const Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyTheme.splash,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : const Text(
                            "Create your account",
                            style: TextStyle(
                              fontSize: 15,
                              color: MyTheme.splash,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    // ============== name ===============
                    login
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              key: ValueKey('nameController'),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Name",
                                hintStyle:
                                    const TextStyle(color: Colors.black45),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Full Name';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  nameController = value!;
                                });
                              },
                            ),
                          ),
                    // ================= email ================
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        key: ValueKey('emailController'),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email Address",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.isEmpty || !value.contains('@')) {
                            return 'Please Enter valid Email';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            emailController = value!;
                          });
                        },
                      ),
                    ),
                    // ============= password ==============
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        style: const TextStyle(color: Colors.black),
                        key: ValueKey('passwordController'),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(color: Colors.black45),
                          fillColor: MyTheme.greyColor,
                          filled: true,
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Please Enter Password of min length 6';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (value) {
                          setState(() {
                            passwordController = value!;
                          });
                        },
                      ),
                    ),
                    // ================ cnfPassword ===============
                    login
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              key: ValueKey('cnfPasswordController'),
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Confirm Password",
                                hintStyle:
                                    const TextStyle(color: Colors.black45),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Please Enter Password of min length 6';
                                } else {
                                  return null;
                                }
                              },
                              onSaved: (value) {
                                setState(() {
                                  cnfPasswordController = value!;
                                });
                              },
                            ),
                          ),
                    // ================ forgot password =================
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Forgort Password?",
                            content: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              controller: forgotEmailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: "Email address",
                                hintStyle:
                                    const TextStyle(color: Colors.black45),
                                fillColor: MyTheme.greyColor,
                                filled: true,
                              ),
                            ),
                            radius: 10,
                            onWillPop: () {
                              forgotEmailController.text = "";

                              return Future.value(true);
                            },
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            confirm: ElevatedButton(
                              onPressed: () {
                                AuthController.instance.forgorPassword(
                                    forgotEmailController.text.trim());
                                forgotEmailController.text = "";
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: MyTheme.splash,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              child: const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(12),
                                  child: Text(
                                    "Send Reset Mail",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    // ================== submit button =============
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          login
                              ? AuthServices.signinUser(
                                  emailController, passwordController, context)
                              : AuthServices.signupUser(emailController,
                                  passwordController, nameController, context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyTheme.splash,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Text(
                            login ? 'Login' : 'Signup',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Or",
                              style: TextStyle(color: Color(0xFFC1C1C1)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 0.5,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: SocialLoginButtons(
                        onFbClick: () {},
                        onGoogleClick: () {
                          AuthController.instance.googleLogin();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: login
                          ? "Don’t have an account ? "
                          : "Already have an account? ",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: login ? "Sign Up" : "Login",
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            login = !login;
                          });
                        },
                    ),
                    const TextSpan(
                      text: " here.",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
