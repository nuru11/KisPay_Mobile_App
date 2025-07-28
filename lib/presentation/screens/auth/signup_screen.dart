import 'package:animate_do/animate_do.dart';
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
    final hasSpecialChar = password.contains(RegExp(r'[!@#\\$&*~]'));
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                child: Image.asset(AppAssets.mainLogo, width: 100, height: 100),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                duration: const Duration(milliseconds: 1300),
                child: const Text(
                  "The Future of Digital Payments!",
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
                                boxShadow: [
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      focusNode: phoneFocusNode,
                                      controller: phoneController,
                                      keyboardType: TextInputType.phone,
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      focusNode: emailFocusNode,
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
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
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: TextField(
                                      focusNode: confirmPasswordNode,
                                      controller: confirmPasswordController,
                                      obscureText: !_isConfirmPasswordVisible,
                                      decoration: InputDecoration(
                                        labelText: 'Confirm Password',
                                        labelStyle: TextStyle(
                                          color: confirmPasswordNode.hasFocus ? mainColor : grey5E,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (passwordController.text.trim().isNotEmpty && confirmPasswordController.text.trim().isNotEmpty && confirmPasswordController.text.trim() != passwordController.text.trim())
                            FadeInUp(
                              duration: const Duration(milliseconds: 1500),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("Password is not the same", style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ),
                          if (passwordController.text.trim().isNotEmpty)
                            FadeInUp(
                              duration: const Duration(milliseconds: 1500),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildRequirement("At least 8 characters", passwordController.text.length >= 8),
                                    _buildRequirement("Includes uppercase letter", RegExp(r'[A-Z]').hasMatch(passwordController.text)),
                                    _buildRequirement("Includes lowercase letter", RegExp(r'[a-z]').hasMatch(passwordController.text)),
                                    _buildRequirement("Includes a number", RegExp(r'[0-9]').hasMatch(passwordController.text)),
                                    _buildRequirement("Includes special character (!@#\$&*~)", RegExp(r'[!@#\$&*~]').hasMatch(passwordController.text)),
                                  ],
                                ),
                              ),
                            ),
                          const SizedBox(height: 25),
                          // Create Account button
                          FadeInUp(
                            duration: const Duration(milliseconds: 1600),
                            child: Obx(() => CustomButton(
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
                          ),
                          // Error message
                          Obx(() => controller.errorMessage.value.isNotEmpty
                              ? FadeInUp(
                                  duration: const Duration(milliseconds: 1700),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      controller.errorMessage.value,
                                      style: TextStyle(color: red49),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink()),
                          const SizedBox(height: 25),
                          // Login text
                          FadeInUp(
                            duration: const Duration(milliseconds: 1800),
                            child: const Text(
                              "Do you have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 20),
                          FadeInUp(
                            duration: const Duration(milliseconds: 1900),
                            child: MaterialButton(
                              onPressed: () => Get.offNamed('/login'),
                              height: 50,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              color: Colors.black,
                              child: const Center(
                                child: Text(
                                  "Login",
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
                      const TextSpan(text: "By signing in you are agreeing to our "),
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
            return const SizedBox.shrink();
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
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: isMet ? Colors.green : Colors.red, fontSize: 13)),
      ],
    );
  }
}