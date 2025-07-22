
 import 'package:kispay_merchant/config/assets.dart';

import 'onboarding_info.dart';

class OnboardingItems{
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "Your Trusted Payment Gateway in Ethiopia",
        descriptions: "Experience seamless transactions at your fingertips. Empowering your payments with security and ease.",
        image: AppAssets.onboarding1Png),

    OnboardingInfo(
        title: "Instant Payments Anytime, Anywhere",
        descriptions: "Enjoy quick payments and transfers, ensuring your money moves as fast as you do.",
        image: AppAssets.onboarding2Png),

    OnboardingInfo(
        title: "Start Your Payment Journey Today",
        descriptions: "Use the app and unlock a world of possibilities. Let’s make payments easier together!",
        image: AppAssets.onboarding3Png),

  ];
 }