import 'package:kispay_merchant/Onboboarding/onboarding_items.dart';
import 'package:kispay_merchant/config/routes.dart';
import 'package:kispay_merchant/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final onboardingController = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  itemCount: onboardingController.items.length,
                  onPageChanged: (index) => setState(() {
                    isLastPage = onboardingController.items.length - 1 == index;
                  }),
                  itemBuilder: (context, index) {
                    final item = onboardingController.items[index];
                    return _buildOnboardingPage(item, index, screenHeight, screenWidth);
                  },
                ),
                Positioned(
                  bottom: screenHeight * 0.05,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Column(
                      children: [
                        if (!isLastPage)
                          SmoothPageIndicator(
                            controller: pageController,
                            count: onboardingController.items.length,
                            effect: WormEffect(
                              dotHeight: 10,
                              dotWidth: 10,
                              spacing: 8,
                              activeDotColor: mainColor,
                              dotColor: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        SizedBox(height: screenHeight * 0.03),
                        isLastPage ? _buildGetStartedButton(screenWidth) : _buildNavigationButtons(screenWidth),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildOnboardingPage(dynamic item, int index, double height, double width) {
  return Stack(
    children: [
      // Top SVG shape for visual identity
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: SvgPicture.asset(
          item.shape,
          width: width,
          height: height * 0.14,
          fit: BoxFit.cover,
        ),
      ),

      // Content layout
      Padding(
        padding: EdgeInsets.only(
          top: height * 0.18,
          left: width * 0.06,
          right: width * 0.06,
          bottom: height * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Onboarding image
            SvgPicture.asset(
              item.image,
              height: height * 0.28,
              fit: BoxFit.contain,
            ),

            SizedBox(height: height * 0.05),

            // Title
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width < 360 ? 20 : 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                letterSpacing: 0.3,
                height: 1.4,
              ),
            ),

            SizedBox(height: height * 0.025),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.03),
              child: Text(
                item.descriptions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: width < 360 ? 14 : 16,
                  fontWeight: FontWeight.w400,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


  Widget _buildNavigationButtons(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => pageController.jumpToPage(onboardingController.items.length - 1),
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: 12),
          ),
          child: const Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGetStartedButton(double width) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isFirstTime', false);
          Get.offNamed(AppRoutes.login);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
