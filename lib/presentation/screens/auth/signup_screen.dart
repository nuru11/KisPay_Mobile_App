/* mine */

import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final AuthController controller = Get.find<AuthController>();

  final TextEditingController firstNameController = TextEditingController();  
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();
  final FocusNode middleNameFocusNode = FocusNode();
  final FocusNode lastNameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode businessNameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordNode = FocusNode();

  bool _isFormValid = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    firstNameController.addListener(_validateForm);
    middleNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    phoneController.addListener(_validateForm);
    businessNameController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    emailFocusNode.addListener(() => setState(() {}));
    passwordFocusNode.addListener(() => setState(() {}));
    confirmPasswordNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    businessNameController.dispose();
    confirmPasswordController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordController.dispose();

    firstNameFocusNode.dispose();
    middleNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    phoneFocusNode.dispose();
    businessNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordNode.dispose();
    super.dispose();
  }

  bool _isPasswordStrong(String password) {
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasLowercase = password.contains(RegExp(r'[a-z]'));
  final hasDigit = password.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = password.contains(RegExp(r'[!@#\$&*~]'));
  final hasMinLength = password.length >= 8;

  return hasUppercase && hasLowercase && hasDigit && hasSpecialChar && hasMinLength;
}


  void _validateForm() {
    final emailValid = GetUtils.isEmail(emailController.text.trim());
    final passwordValid = _isPasswordStrong(passwordController.text.trim());

    final confirmPasswordValid = confirmPasswordController.text.trim() == passwordController.text.trim();
    final firstNameValid = firstNameController.text.trim().isNotEmpty;
    final lastNameValid = lastNameController.text.trim().isNotEmpty;
    final phoneValid = phoneController.text.trim().isNotEmpty;
    setState(() {
      _isFormValid = emailValid && passwordValid && confirmPasswordValid && firstNameValid && lastNameValid && phoneValid;
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
                              focusNode: firstNameFocusNode,
                              controller: firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                labelStyle: TextStyle(
                                  color: firstNameFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: middleNameFocusNode,
                              controller: middleNameController,
                              decoration: InputDecoration(
                                labelText: 'Middle Name',
                                labelStyle: TextStyle(
                                  color: middleNameFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: lastNameFocusNode,
                              controller: lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                labelStyle: TextStyle(
                                  color: lastNameFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: phoneFocusNode,
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(
                                  color: phoneFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                            SizedBox(height: 20),
                            TextField(
                              focusNode: businessNameFocusNode,
                              controller: businessNameController,
                              decoration: InputDecoration(
                                labelText: 'Business Name',
                                labelStyle: TextStyle(
                                  color: businessNameFocusNode.hasFocus ? mainColor : grey5E,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: mainColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: grey5E),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
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

                            SizedBox(height: 20,),

                             TextField(
                              focusNode: confirmPasswordNode,
                              controller: confirmPasswordController,
                              obscureText: !_isConfirmPasswordVisible,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
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
                                    _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: mainColor,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),

                           passwordController.text.trim().isNotEmpty && confirmPasswordController.text.trim().isNotEmpty && confirmPasswordController.text.trim() != passwordController.text.trim() ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Password is not the same", style: TextStyle(color: Colors.red),),
                              ],
                            ) : Text(''),

                          
                            passwordController.text.trim().isNotEmpty ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              
                              children: 
                             [
                             Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    _buildRequirement("At least 8 characters", passwordController.text.length >= 8),
    _buildRequirement("Includes uppercase letter", RegExp(r'[A-Z]').hasMatch(passwordController.text)),
    _buildRequirement("Includes lowercase letter", RegExp(r'[a-z]').hasMatch(passwordController.text)),
    _buildRequirement("Includes a number", RegExp(r'[0-9]').hasMatch(passwordController.text)),
    _buildRequirement("Includes special character (!@#\$&*~)", RegExp(r'[!@#\$&*~]').hasMatch(passwordController.text)),
  ],
),

                             ]
                             ) : Text(""),
                             SizedBox(height: 20,),
                            Obx(() => CustomButton(
                                  text: 'Create Account',
                                  onPressed: controller.registerStatus.value == 'loading' || !_isFormValid
                                      ? null
                                      : () {
                                          controller.register(
                                            firstNameController.text.trim(),
                                            middleNameController.text.trim(),
                                            lastNameController.text.trim(),
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
                                Text("Do you have account?"),
                                TextButton(
                                  onPressed: () {
                                    Get.offNamed('/login');
                                  },
                                  child: Text("Login", style: TextStyle(color: mainColor)),
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

        floatingActionButton: Obx(() {
          if (controller.registerStatus.value == 'loading') {
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



  Widget _buildRequirement(String text, bool isMet) {
  return Row(
    children: [
      Icon(isMet ? Icons.check_circle : Icons.cancel, size: 16, color: isMet ? Colors.green : Colors.red),
      SizedBox(width: 8),
      Text(text, style: TextStyle(color: isMet ? Colors.green : Colors.red, fontSize: 13)),
    ],
  );
}

}







/* deepseek */

// import 'package:kispay_merchant/config/assets.dart';
// import 'package:kispay_merchant/core/constant/colors.dart';
// import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
// import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AuthController controller = Get.find<AuthController>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();

//   bool _isFormValid = false;
//   bool _obscurePassword = true;

//   @override
//   void initState() {
//     super.initState();
//     emailController.addListener(_validateForm);
//     passwordController.addListener(_validateForm);
//   }

//   @override
//   void dispose() {
//     emailController.removeListener(_validateForm);
//     passwordController.removeListener(_validateForm);
//     emailController.dispose();
//     passwordController.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void _validateForm() {
//     final emailValid = GetUtils.isEmail(emailController.text.trim());
//     final passwordValid = passwordController.text.trim().length >= 6;
//     setState(() {
//       _isFormValid = emailValid && passwordValid;
//     });
    
//   }

//   Future<void> _launchURL() async {
//     final Uri url = Uri.parse('https://afropay.co/policy');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       Get.snackbar('Error', 'Could not launch URL',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         const SizedBox(height: 40),
//                         Hero(
//                           tag: 'app-logo',
//                           child: Image.asset(
//                             AppAssets.mainLogo,
//                             height: 120,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         const SizedBox(height: 40),
//                         Text(
//                           'Welcome Back',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: mainColor,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Sign in to continue to AfroPay',
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: grey5E,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(height: 40),
//                         TextField(
//                           focusNode: emailFocusNode,
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             prefixIcon: Icon(Icons.email_outlined),
//                             labelStyle: TextStyle(
//                               color: emailFocusNode.hasFocus ? mainColor : grey5E,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: mainColor, width: 2),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: grey5E),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 16, horizontal: 16),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           textInputAction: TextInputAction.next,
//                           onSubmitted: (_) =>
//                               FocusScope.of(context).requestFocus(passwordFocusNode),
//                         ),
//                         const SizedBox(height: 20),
//                         TextField(
//                           focusNode: passwordFocusNode,
//                           controller: passwordController,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             prefixIcon: Icon(Icons.lock_outline),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _obscurePassword
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 color: grey5E,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _obscurePassword = !_obscurePassword;
//                                 });
//                               },
//                             ),
//                             labelStyle: TextStyle(
//                               color: passwordFocusNode.hasFocus ? mainColor : grey5E,
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: mainColor, width: 2),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: grey5E),
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                                 vertical: 16, horizontal: 16),
//                           ),
//                           obscureText: _obscurePassword,
//                           textInputAction: TextInputAction.done,
//                           onSubmitted: (_) {
//                             if (_isFormValid) {
//                               controller.login(
//                                 emailController.text.trim(),
//                                 passwordController.text.trim(),
//                               );
//                             }
//                           },
//                         ),
//                         const SizedBox(height: 8),
//                         Align(
//                           alignment: Alignment.centerRight,
//                           child: TextButton(
//                             onPressed: () {
//                               // Get.toNamed('/forgot-password');
//                                Get.snackbar('Info', 'Forgot Password feature coming soon!', backgroundColor: mainColor);
//                             },
//                             child: Text(
//                               'Forgot Password?',
//                               style: TextStyle(
//                                 color: mainColor,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         Obx(() {
//                           if (controller.loginStatus.value == 'loading') {
//                             return Center(
//                               child: CircularProgressIndicator(
//                                 valueColor:
//                                     AlwaysStoppedAnimation<Color>(mainColor),
//                               ),
//                             );
//                           }
//                           return CustomButton(
//                             text: 'Login',
//                             onPressed: _isFormValid
//                                 ? () {
//                                     controller.login(
//                                       emailController.text.trim(),
//                                       passwordController.text.trim(),
//                                     );
//                                   }
//                                 : null,
//                           );
//                         }),
//                         const SizedBox(height: 16),
//                         Obx(() => controller.errorMessage.value.isNotEmpty
//                             ? Container(
//                                 padding: EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: red49.withOpacity(0.1),
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.error_outline, color: red49),
//                                     SizedBox(width: 8),
//                                     Expanded(
//                                       child: Text(
//                                         controller.errorMessage.value,
//                                         style: TextStyle(color: red49),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               )
//                             : SizedBox.shrink()),
//                         const SizedBox(height: 24),
//                         Row(
//                           children: [
//                             Expanded(child: Divider()),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16),
//                               child: Text(
//                                 'OR',
//                                 style: TextStyle(color: grey5E),
//                               ),
//                             ),
//                             Expanded(child: Divider()),
//                           ],
//                         ),
//                         const SizedBox(height: 24),
//                         OutlinedButton.icon(
//                           icon: Image.asset(AppAssets.mainLogo, height: 24),
//                           label: Text('Continue with Google'),
//                           style: OutlinedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             side: BorderSide(color: grey5E),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             // Handle Google sign in
//                           },
//                         ),
//                         const SizedBox(height: 16),
//                         OutlinedButton.icon(
//                           icon: Image.asset(AppAssets.mainLogo, height: 24),
//                           label: Text('Continue with Apple'),
//                           style: OutlinedButton.styleFrom(
//                             padding: EdgeInsets.symmetric(vertical: 16),
//                             side: BorderSide(color: grey5E),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {
//                             // Handle Apple sign in
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 24.0, top: 16),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(color: grey5E, fontSize: 14),
//                       children: [
//                         TextSpan(text: "Don't have an account? "),
//                         TextSpan(
//                           text: "Register",
//                           style: TextStyle(
//                             color: mainColor,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           recognizer: TapGestureRecognizer()
//                             ..onTap = () => /*Get.toNamed('/register')*/  Get.snackbar('Info', 'Register screen coming soon!'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 16.0),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(color: grey5E, fontSize: 12),
//                       children: [
//                         TextSpan(text: "By signing in you agree to our "),
//                         TextSpan(
//                           text: "Terms and Privacy Policy",
//                           style: TextStyle(
//                             color: mainColor,
//                             decoration: TextDecoration.underline,
//                           ),
//                           recognizer: TapGestureRecognizer()..onTap = _launchURL,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }













/* grok */

// import 'package:kispay_merchant/config/assets.dart';
// import 'package:kispay_merchant/core/constant/colors.dart';
// import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
// import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final AuthController controller = Get.find<AuthController>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   final FocusNode emailFocusNode = FocusNode();
//   final FocusNode passwordFocusNode = FocusNode();

//   bool _isFormValid = false;
//   bool _showEmailError = false;
//   bool _showPasswordError = false;

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
//     emailController.removeListener(_validateForm);
//     passwordController.removeListener(_validateForm);
//     emailController.dispose();
//     passwordController.dispose();
//     emailFocusNode.dispose();
//     passwordFocusNode.dispose();
//     super.dispose();
//   }

//   void _validateForm() {
//     final emailValid = GetUtils.isEmail(emailController.text.trim());
//     final passwordValid = passwordController.text.trim().length >= 6;

//     setState(() {
//       _isFormValid = emailValid && passwordValid;
//       _showEmailError = emailController.text.isNotEmpty && !emailValid;
//       _showPasswordError = passwordController.text.isNotEmpty && !passwordValid;
//     });
//   }

//   void _launchURL() async {
//     final Uri url = Uri.parse('https://afropay.co/policy');
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url, mode: LaunchMode.externalApplication);
//     } else {
//       Get.snackbar('Error', 'Could not launch URL', backgroundColor: Colors.redAccent, colorText: Colors.white);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         resizeToAvoidBottomInset: true,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40),
//                 Image.asset(
//                   AppAssets.mainLogo,
//                   width: 180,
//                   fit: BoxFit.contain,
//                 ),
//                 SizedBox(height: 32),
//                 Text(
//                   'Welcome Back',
//                   style: TextStyle(
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                     color: mainColor,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Sign in to continue with Afropay',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: grey5E,
//                   ),
//                 ),
//                 SizedBox(height: 40),
//                 TextField(
//                   focusNode: emailFocusNode,
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.email_outlined, color: emailFocusNode.hasFocus ? mainColor : grey5E),
//                     labelText: 'Email',
//                     labelStyle: TextStyle(color: emailFocusNode.hasFocus ? mainColor : grey5E),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: mainColor, width: 2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: grey5E),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: red49),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: red49, width: 2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     errorText: _showEmailError ? 'Please enter a valid email' : null,
//                     filled: true,
//                     fillColor: Colors.grey[50],
//                   ),
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 16),
//                 TextField(
//                   focusNode: passwordFocusNode,
//                   controller: passwordController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock_outline, color: passwordFocusNode.hasFocus ? mainColor : grey5E),
//                     labelText: 'Password',
//                     labelStyle: TextStyle(
//                       color: passwordFocusNode.hasFocus ? mainColor : grey5E,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: mainColor, width: 2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: grey5E),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: red49),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     focusedErrorBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: red49, width: 2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     errorText: _showPasswordError ? 'Password must be at least 6 characters' : null,
//                     filled: true,
//                     fillColor: Colors.grey[50],
//                   ),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 12),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.snackbar('Info', 'Forgot Password feature coming soon!', backgroundColor: mainColor, colorText: Colors.white);
//                     },
//                     child: Text(
//                       'Forgot Password?',
//                       style: TextStyle(
//                         color: mainColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 Obx(() => controller.loginStatus.value == 'loading'
//                     ? CircularProgressIndicator(color: mainColor)
//                     : AnimatedContainer(
//                         duration: Duration(milliseconds: 300),
//                         width: double.infinity,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           gradient: _isFormValid
//                               ? LinearGradient(colors: [mainColor, mainColor.withOpacity(0.8)])
//                               : LinearGradient(colors: [grey5E, grey5E]),
//                           borderRadius: BorderRadius.circular(12),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.2),
//                               blurRadius: 8,
//                               offset: Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: CustomButton(
//   text: 'Login',
//   onPressed: _isFormValid
//       ? () {
//           controller.login(
//             emailController.text.trim(),
//             passwordController.text.trim(),
//           );
//         }
//       : null,
// ),
//                       )),
//                 Obx(() => controller.errorMessage.value.isNotEmpty
//                     ? Padding(
//                         padding: EdgeInsets.only(top: 16),
//                         child: Text(
//                           controller.errorMessage.value,
//                           style: TextStyle(color: red49, fontSize: 14),
//                         ),
//                       )
//                     : SizedBox.shrink()),
//                 SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Don't have an account? ",
//                       style: TextStyle(color: grey5E, fontSize: 16),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.snackbar('Info', 'Register screen coming soon!', backgroundColor: mainColor, colorText: Colors.white);
//                       },
//                       child: Text(
//                         'Register',
//                         style: TextStyle(
//                           color: mainColor,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 32),
//                 Divider(color: grey5E.withOpacity(0.5)),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   child: RichText(
//                     textAlign: TextAlign.center,
//                     text: TextSpan(
//                       style: TextStyle(color: grey5E, fontSize: 14),
//                       children: [
//                         TextSpan(text: 'By signing in you are agreeing to our '),
//                         TextSpan(
//                           text: 'Terms and Privacy Policies',
//                           style: TextStyle(
//                             color: mainColor,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           recognizer: TapGestureRecognizer()..onTap = _launchURL,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






