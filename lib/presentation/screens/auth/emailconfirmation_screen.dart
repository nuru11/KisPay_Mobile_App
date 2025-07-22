import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/presentation/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/core/constant/colors.dart'; 

class EmailConfirmationScreen extends StatelessWidget {
  const EmailConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String firstName = args['firstName'] ?? '';
    final String middleName = args['middleName'] ?? '';
    final String lastName = args['lastName'] ?? '';
    final String email = args['email'] ?? '';

    final AuthController controller = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Confirmation'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mark_email_read, size: 100, color: mainColor), 
            const SizedBox(height: 20),
            const Text(
              "Confirmation Email Sent",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "Hi $firstName $middleName $lastName,\n\nWe’ve sent a confirmation email to:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            const SizedBox(height: 30),
            Text(
              "Please check your inbox and click the link to verify your email address.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            const SizedBox(height: 40),

            Obx(() => CustomButton(
              text: controller.resendEmailConfirmationStatus.value == 'loading'
                  ? 'Sending...'
                  : 'Resend Confirmation Email',
              onPressed: controller.resendEmailConfirmationStatus.value == 'loading'
                  ? null
                  : () {
                      controller.resendConfirmationEmail(email);
                    },
            )),

            const SizedBox(height: 16),

            CustomButton(
              text: "Login",
              onPressed: () {
                Get.offAllNamed('/login');
              },
              // isOutlined: true, 
            ),
          ],
        ),
      ),

      floatingActionButton: Obx(() {
        if (controller.resendEmailConfirmationStatus.value == 'loading') {
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