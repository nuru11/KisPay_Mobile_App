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


class LoginScreenaa extends StatefulWidget {
  @override
  _LoginScreenaaState createState() => _LoginScreenaaState();
}

class _LoginScreenaaState extends State<LoginScreenaa> {
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
    final Uri url = Uri.parse('https://afropay.co/policy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not launch URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: screenHeight * 0.05),
                            Center(
                              child: SizedBox(
                                width: screenWidth * 0.5,
                                child: Image.asset(AppAssets.mainLogo),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "The Future of Digital Payments!",
                              style: TextStyle(
                                fontSize: screenWidth < 360 ? 15 : 21,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFEF7B24),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 40),
                            TextField(
                              focusNode: emailFocusNode,
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: emailFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: passwordFocusNode,
                              controller: passwordController,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: passwordFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                 Get.toNamed('/forgetpassword');
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(color: mainColor, fontSize: 16),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Obx(() => CustomButton(
                                  text: 'Login',
                                  onPressed: controller.loginStatus.value == 'loading' || !_isFormValid
                                      ? null
                                      : () {
                                          controller.login(
                                            emailController.text.trim(),
                                            passwordController.text.trim(),
                                          );
                                        },
                                )),
                            Obx(() => controller.errorMessage.value.isNotEmpty
                                ? Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text(
                                      controller.errorMessage.value,
                                      style: TextStyle(color: red49),
                                    ),
                                  )
                                : SizedBox.shrink()),
                            SizedBox(height: screenHeight * 0.04),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Get.offNamed('/curve_bar');
                                  },
                                  child: Text("Register", style: TextStyle(color: mainColor)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Divider(height: 1),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                  children: [
                    TextSpan(text: "By signing in you are agreeing to our "),
                    TextSpan(
                      text: "Terms and Privacy Policies",
                      style: TextStyle(color: mainColor, fontWeight: FontWeight.w600),
                      recognizer: TapGestureRecognizer()..onTap = _launchURL,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        /// Loading overlay
        // ignore: avoid_unnecessary_containers
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
      ),
    );
  }
}














// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AuthController controller = Get.find<AuthController>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();

//   bool _isFormValid = false;
//   bool _isPasswordVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(_validateForm);
//     passwordController.addListener(_validateForm);
//     emailFocusNode.addListener(() => setState(() {}));
//     passwordFocusNode.addListener(() => setState(() {}));
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void _validateForm() {
//     final emailValid = GetUtils.isEmail(emailController.text.trim());
//     final passwordValid = passwordController.text.trim().isNotEmpty;
//     setState(() {
//       _isFormValid = emailValid && passwordValid;
//     });
//   }

//   void _launchURL() async {
//     final Uri url = Uri.parse('https://afropay.co/policy');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       Get.snackbar('Error', 'Could not launch URL');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Scaffold(
//         body: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [
//                 mainColor,
//                 mainColor.withOpacity(0.8),
//                 mainColor.withOpacity(0.4)
//               ],
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const SizedBox(height: 80),
              

//               const SizedBox(height: 20),

//               /// ✅ Company Logo
//               Center(
//                 child: FadeInUp(
//                   duration: const Duration(milliseconds: 1200),
//                   child: Image.asset(
//                     AppAssets.mainLogo,
//                     height: 80,
//                   ),
//                 ),
//               ),
//                 const SizedBox(height: 10),
//                     Center(
//                       child: FadeInUp(
//                           duration: const Duration(milliseconds: 1300),
//                           child: const Text("Welcome Back",
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 18))),
//                     ),

//               const SizedBox(height: 20),

//               /// Login Form Container
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(60),
//                         topRight: Radius.circular(60)),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(30),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: <Widget>[
//                           const SizedBox(height: 40),
//                           FadeInUp(
//                             duration: const Duration(milliseconds: 1400),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: const [
//                                   BoxShadow(
//                                     color: Color.fromRGBO(225, 95, 27, .3),
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10),
//                                   ),
//                                 ],
//                               ),
//                               child: Column(
//                                 children: <Widget>[
//                                   Container(
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         border: Border(
//                                             bottom: BorderSide(
//                                                 color:
//                                                     Colors.grey.shade200))),
//                                     child: TextField(
//                                       focusNode: emailFocusNode,
//                                       controller: emailController,
//                                       decoration: InputDecoration(
//                                         labelText: 'Email',
//                                         labelStyle: TextStyle(
//                                           color: emailFocusNode.hasFocus
//                                               ? mainColor
//                                               : grey5E,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: mainColor),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: grey5E),
//                                         ),
//                                       ),
//                                       keyboardType: TextInputType.emailAddress,
//                                     ),
//                                   ),
//                                   Container(
//                                     padding: const EdgeInsets.all(10),
//                                     child: TextField(
//                                       focusNode: passwordFocusNode,
//                                       controller: passwordController,
//                                       obscureText: !_isPasswordVisible,
//                                       decoration: InputDecoration(
//                                         labelText: 'Password',
//                                         labelStyle: TextStyle(
//                                           color: passwordFocusNode.hasFocus
//                                               ? mainColor
//                                               : grey5E,
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: mainColor),
//                                         ),
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: grey5E),
//                                         ),
//                                         suffixIcon: IconButton(
//                                           icon: Icon(
//                                             _isPasswordVisible
//                                                 ? Icons.visibility
//                                                 : Icons.visibility_off,
//                                             color: mainColor,
//                                           ),
//                                           onPressed: () {
//                                             setState(() {
//                                               _isPasswordVisible =
//                                                   !_isPasswordVisible;
//                                             });
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30),
//                           FadeInUp(
//                             duration: const Duration(milliseconds: 1500),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Get.toNamed('/curve_bar');
//                               },
//                               child: const Text(
//                                 "Forgot Password?",
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 30),

//                           /// Login Button
//                           Obx(() => CustomButton(
//                                 text: 'Login',
//                                 onPressed: controller.loginStatus.value ==
//                                             'loading' ||
//                                         !_isFormValid
//                                     ? null
//                                     : () {
//                                         controller.login(
//                                           emailController.text.trim(),
//                                           passwordController.text.trim(),
//                                         );
//                                       },
//                               )),

//                           /// Error message
//                           Obx(() => controller.errorMessage.value.isNotEmpty
//                               ? Padding(
//                                   padding: const EdgeInsets.only(top: 10),
//                                   child: Text(
//                                     controller.errorMessage.value,
//                                     style: TextStyle(color: red49),
//                                   ),
//                                 )
//                               : const SizedBox.shrink()),

//                           const SizedBox(height: 30),
//                           FadeInUp(
//                             duration: const Duration(milliseconds: 1700),
//                             child: const Text(
//                               "Don't have an account?",
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           Row(
//                             children: <Widget>[
                              
//                               const SizedBox(width: 30),
//                               Expanded(
//                                 child: FadeInUp(
//                                   duration: const Duration(milliseconds: 1900),
//                                   child: MaterialButton(
//   onPressed: () {},
//   height: 50,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(50),
//   ),
//   color: Colors.black,
//   child: const Center(
//     child: Text(
//       "Sign Up",
//       style: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold),
//     ),
//   ),
// ),

//                                 ),
//                               )
//                             ],
//                           ),
//                           const SizedBox(height: 30),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),

//               /// Terms & Privacy
//               const Divider(height: 1),
//               Container(
//                 color: Colors.white,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 12.0, horizontal: 20),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(
//                           color: Colors.grey.shade600, fontSize: 14),
//                       children: [
//                         const TextSpan(text: "By signing in you are agreeing to our "),
//                         TextSpan(
//                           text: "Terms and Privacy Policies",
//                           style: TextStyle(
//                               color: mainColor, fontWeight: FontWeight.w600),
//                           recognizer: TapGestureRecognizer()..onTap = _launchURL,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }























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
    final Uri url = Uri.parse('https://afropay.co/policy');
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
              mainColor,
              mainColor.withOpacity(0.8),
              mainColor.withOpacity(0.4),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),

            // Logo and welcome text
            FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: Image.asset(AppAssets.mainLogo, height: 80),
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
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
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
                              Get.toNamed('/curve_bar');
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
                              Get.offNamed('/sign_up');
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
    );
  }
}
