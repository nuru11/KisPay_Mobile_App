import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/core/services/locale_service.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/widgets/app_bar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});






  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    return Scaffold(
      appBar: CustomAppBar(title: 'settings'.tr),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          _buildProfileHeader(),
          const Divider(height: 40),

          _buildSectionTitle("General"),
          _buildSettingTile(
            icon: Icons.notifications_none,
            title: 'notifications'.tr,
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.lock_outline,
            title: 'security'.tr,
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.language,
            title: 'language'.tr,
            onTap: () => _showLanguageSelector(context),
            trailing: Text(Get.locale?.languageCode == 'am' ? 'አማ' : 'EN'),
          ),

          const Divider(height: 40),

          _buildSectionTitle("App Info"),
          _buildSettingTile(
            icon: Icons.info_outline,
            title: 'about_app'.tr,
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.privacy_tip_outlined,
            title: 'privacy_policy'.tr,
            onTap: () {},
          ),
          _buildSettingTile(
            icon: Icons.article_outlined,
            title: 'terms_conditions'.tr,
            onTap: () {},
          ),

          const Divider(height: 40),

          _buildSectionTitle("Account"),
          _buildSettingTile(
            icon: Icons.logout,
            title: 'logout'.tr,
            iconColor: Colors.red,
            titleColor: Colors.red,
            onTap: () {
              Get.defaultDialog(
                title: 'confirm_logout'.tr,
                content: Text('are_you_sure_logout'.tr),
                textCancel: 'cancel'.tr,
                textConfirm: 'logout'.tr,
                confirmTextColor: Colors.white,
                onConfirm: controller.signOut,
              );
            },
          ),

          const SizedBox(height: 30),
          Center(
            child: Text(
              'all_right_reserved'.tr,
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return ListTile(
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: mainColor.withOpacity(0.1),
        child: Icon(Icons.person, size: 30, color: mainColor),
      ),
      title: const Text("Merchant Name",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
      subtitle: const Text("merchant@example.com"),
      trailing: IconButton(
        icon: Icon(Icons.edit, color: mainColor),
        onPressed: () {
          Get.toNamed('/update_user_information');
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
    Color iconColor = const Color(0xFF23246B),
    Color titleColor = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(color: titleColor)),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showLanguageSelector(BuildContext context) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('English'),
            onTap: () async {
              const locale = Locale('en', 'US');
              await LocaleService.saveLocale(locale);
              Get.updateLocale(locale);
              Get.back();
            },
          ),
          ListTile(
            title: const Text('አማርኛ'),
            onTap: () async {
              const locale = Locale('am', 'ET');
              await LocaleService.saveLocale(locale);
              Get.updateLocale(locale);
              Get.back();
            },
          ),
        ],
      ),
    ),
  );
}
}
