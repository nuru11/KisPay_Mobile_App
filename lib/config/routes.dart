// lib/config/routes.dart
import 'package:kispay_merchant/Onboboarding/onboarding_view.dart';
import 'package:kispay_merchant/bottom_nav/main_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/emailconfirmation_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/forgetpassword_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/signup_screen.dart';
import 'package:kispay_merchant/presentation/screens/banks_screen.dart';
import 'package:kispay_merchant/presentation/screens/curve_navigation/curve_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/presentation/screens/transactions_list_screen.dart';
import '../presentation/screens/auth/login_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/bindings/auth_binding.dart';
import '../presentation/bindings/combined_binding.dart';

class AppRoutes {
  // Route name constants
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String home = '/home';
  static const String mainScreen = '/main_screen';
  static const String banks = '/banks';
  static const String signUp = '/sign_up';
  static const String emailconfirmation = '/email_confirmation';
  static const String forgetpassword = '/forgetpassword';
  static const String curveBar = '/curve_bar';
  static const String transactionsList = '/transactions_list';

  // Route definitions
  static final List<GetPage> routes = [
    GetPage(
      name: onboarding,
      page: () => OnboardingView(),
      // binding: OnboardingBinding(), 
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: CombinedBinding(),
    ),
    GetPage(
      name: mainScreen,
      page: () => MainScreen(),
      binding: CombinedBinding(),
    ),
    GetPage(
      name: curveBar,
      page: () => CurveBar(),
      binding: CombinedBinding(),
    ),
    GetPage(
      name: banks,
      page: () => BanksScreen(),
      binding: CombinedBinding(),
    ),
    GetPage(
      name: signUp,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: emailconfirmation,
      page: () => EmailConfirmationScreen(),
      // binding: AuthBinding(),
    ),

    GetPage(
      name: forgetpassword,
      page: () => ForgetPasswordScreen(),
      // binding: AuthBinding(),
    ),

    GetPage(
      name: transactionsList,
      page: () => TransactionsListScreen(),
      // binding: AuthBinding(),
    ),
    
  ];
}