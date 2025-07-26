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
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 40),
                            _buildTextField('First Name', firstNameController, firstNameFocusNode),
                            SizedBox(height: 20),
                            _buildTextField('Middle Name', middleNameController, middleNameFocusNode),
                            SizedBox(height: 20),
                            _buildTextField('Last Name', lastNameController, lastNameFocusNode),
                            SizedBox(height: 20),
                            _buildTextField('Phone Number', phoneController, phoneFocusNode, TextInputType.phone),
                            SizedBox(height: 20),
                            _buildTextField('Business Name', businessNameController, businessNameFocusNode),
                            SizedBox(height: 20),
                            _buildTextField('Email', emailController, emailFocusNode, TextInputType.emailAddress),
                            SizedBox(height: 20),
                            _buildPasswordField('Password', passwordController, passwordFocusNode, _isPasswordVisible, () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            }),
                            SizedBox(height: 20),
                            _buildPasswordField('Confirm Password', confirmPasswordController, confirmPasswordNode, _isConfirmPasswordVisible, () {
                              setState(() {
                                _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                              });
                            }),
                            if (passwordController.text.trim().isNotEmpty && confirmPasswordController.text.trim().isNotEmpty && confirmPasswordController.text.trim() != passwordController.text.trim())
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Password is not the same", style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            if (passwordController.text.trim().isNotEmpty)
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
                            SizedBox(height: 20),
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
                                  onPressed: () => Get.offNamed('/login'),
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

  Widget _buildTextField(String label, TextEditingController controller, FocusNode focusNode, [TextInputType? type]) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: focusNode.hasFocus ? mainColor : grey5E),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey5E)),
      ),
      keyboardType: type,
    );
  }

  Widget _buildPasswordField(String label, TextEditingController controller, FocusNode focusNode, bool visible, VoidCallback toggle) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      obscureText: !visible,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: focusNode.hasFocus ? mainColor : grey5E),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: mainColor)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: grey5E)),
        suffixIcon: IconButton(
          icon: Icon(visible ? Icons.visibility : Icons.visibility_off, color: mainColor),
          onPressed: toggle,
        ),
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
