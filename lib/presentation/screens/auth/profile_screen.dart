
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kispay_merchant/core/constant/colors.dart'; // adjust your colors here
import 'package:kispay_merchant/config/assets.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart'; // if you have any custom assets

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.white, 

      appBar: const CustomAppBar(title: 'Profile'),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(AppAssets.personalImgPlaceHolder), 
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 12),
            const Text(
              'Nuru Ibrahim',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'nuru@gmail.com',
              style: TextStyle(color: Colors.grey),
            ),
            const Text(
              '+251 966 292 667',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 25),

            _buildActionTile(
              icon: Icons.edit,
              title: 'Edit Profile',
              onTap: () {},
            ),
            _buildActionTile(
              icon: Icons.lock,
              title: 'Change Password',
              onTap: () {},
            ),
            _buildActionTile(
              icon: Icons.account_balance,
              title: 'Linked Bank Accounts',
              onTap: () {},
            ),
            _buildActionTile(
              icon: Icons.security,
              title: '2FA & Security',
              onTap: () {},
            ),
            _buildActionTile(
              icon: Icons.help_outline,
              title: 'Help & Support',
              onTap: () {},
            ),
            const SizedBox(height: 10),

            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
              ),
              onTap: () {
              controller.signOut();
              },
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(icon, color: mainColor),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
