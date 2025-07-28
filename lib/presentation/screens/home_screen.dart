import 'package:get/get.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:kispay_merchant/presentation/controllers/auth_controller.dart';
import 'package:kispay_merchant/presentation/controllers/merchantDetails_controller.dart';
import 'package:kispay_merchant/presentation/widgets/home_screen_banner.dart';
import 'package:kispay_merchant/presentation/widgets/quick_access_grid_widget.dart';
import 'package:kispay_merchant/presentation/widgets/swiper_widget.dart';
import 'package:kispay_merchant/presentation/widgets/transactions_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController controller = Get.find<AuthController>();
  final MerchantDetailsController merchantController = Get.find<MerchantDetailsController>();

  @override
  void initState() {
    super.initState();
    merchantController.merchantDetails();
    // Check if user is logged in
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //   if (!controller.isUserLoggedIn()) {
  //     Get.offNamed('/login'); // Navigate to login page if not logged in
  //   }
  // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            launch('sms:+251966202667');
          },
          child: Icon(Icons.call, color: Colors.white),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: mainColor,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarHeight: 40.0,
          title: Obx(() => Text(
            controller.firstName.value.isNotEmpty ? "Hi, ${controller.firstName.value}" : "Hi, Nuru",
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          )),
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white),
              onPressed: () {
                controller.signOut();
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            child: SwiperBuilder(),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuickAccessGridWidget(),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 150,
                      child: HomeScreenBanner(),
                    ),
                    const SizedBox(height: 20),
                    RecentTransactionBox(),
                    const SizedBox(height: 55),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}