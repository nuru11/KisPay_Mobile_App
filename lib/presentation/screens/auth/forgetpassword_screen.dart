import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final AuthController controller = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();

  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(_validateForm);
  }

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  void _validateForm() {
    final emailValid = GetUtils.isEmail(emailController.text.trim());
    setState(() {
      _isFormValid = emailValid;
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
        appBar: AppBar(
          title: Text('Forgot Password'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offNamed('/login'); 
            },
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: screenHeight * 0.05),
                          Center(
                            child: SizedBox(
                              width: screenWidth,
                              child: Text(
                                "To reset your password, please enter your email address. "
                                "We will send a link to reset your password.",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          Obx(() {
                            if (controller.forgetPasswordMessage.value.isNotEmpty) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20),
                                child: Text(
                                  controller.forgetPasswordMessage.value,
                                  style: TextStyle(color: Colors.green, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            } else {
                              return Column(
                                children: [
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
                                  Obx(() => CustomButton(
                                    text: 'Reset Password',
                                    onPressed: controller.forgetpasswordStatus.value == 'loading' || !_isFormValid
                                        ? null
                                        : () {
                                            controller.forgetPassword(emailController.text.trim());
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
                                ],
                              );
                            }
                          }),
                          SizedBox(height: screenHeight * 0.04),
                        ],
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
                    TextSpan(text: "By resetting your password, you agree to our "),
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
          if (controller.forgetpasswordStatus.value == 'loading') {
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