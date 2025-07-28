import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kispay_merchant/core/constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  bool _isFormValid = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    emailFocusNode.addListener(() => setState(() {}));
    passwordFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _validateForm() {
    final emailValid = GetUtils.isEmail(emailController.text.trim());
    final passwordValid = passwordController.text.trim().isNotEmpty;
    setState(() {
      _isFormValid = emailValid && passwordValid;
    });
  }

  void _launchURL() async {
    final Uri url = Uri.parse('https://kispay.et/policy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not launch URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF3E4095),
              Colors.black,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Logo and welcome text
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Image.asset(AppAssets.mainLogo, width:  100, height: 100,),
            ),
            const SizedBox(height: 10),
            FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: const Text(
                "Welcome Back",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),

            const SizedBox(height: 20),

            // Form section
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),

                        // Input fields
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:  [
                                BoxShadow(
                                  color: mainColor,
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextField(
                                    focusNode: emailFocusNode,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      labelStyle: TextStyle(
                                        color: emailFocusNode.hasFocus
                                            ? mainColor
                                            : grey5E,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: mainColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey5E),
                                      ),
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextField(
                                    focusNode: passwordFocusNode,
                                    controller: passwordController,
                                    obscureText: !_isPasswordVisible,
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                        color: passwordFocusNode.hasFocus
                                            ? mainColor
                                            : grey5E,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: mainColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: grey5E),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: mainColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordVisible =
                                                !_isPasswordVisible;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Forgot password
                        FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: GestureDetector(
                            onTap: () {
                              // Get.toNamed('/curve_bar');
                              Get.toNamed('/forgetpassword');
                            },
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),

                        const SizedBox(height: 25),

                        // Login button
                        Obx(() => CustomButton(
                              text: 'Login',
                              onPressed:
                                  controller.loginStatus.value == 'loading' ||
                                          !_isFormValid
                                      ? null
                                      : () {
                                          controller.login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        },
                            )),

                        // Error message
                        Obx(() => controller.errorMessage.value.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  controller.errorMessage.value,
                                  style: TextStyle(color: red49),
                                ),
                              )
                            : const SizedBox.shrink()),

                        const SizedBox(height: 25),

                        // Signup text
                        FadeInUp(
                          duration: const Duration(milliseconds: 1700),
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),

                        const SizedBox(height: 20),

                        FadeInUp(
                          duration: const Duration(milliseconds: 1900),
                          child: MaterialButton(
                            onPressed: () {
                              Get.toNamed('/sign_up');
                              print("Sign Up Pressed");
                            },
                            height: 50,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.black,
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Terms and policy
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                  ),
                  children: [
                    const TextSpan(text: "By signing in you agree to our "),
                    TextSpan(
                      text: "Terms and Privacy Policies",
                      style: TextStyle(
                          color: mainColor, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = _launchURL,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: Obx(() {
          if (controller.loginStatus.value == 'loading') {
            return Container(
              color: Colors.black.withOpacity(0.4),
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: Image.asset(
                  AppAssets.loadingIcon,
                  width: 150,
                  height: 150,
                ),
              ),
            );
          } else {
            return SizedBox.shrink();
          }
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
