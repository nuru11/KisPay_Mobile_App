// lib/config/routes.dart
import 'package:kispay_merchant/Onboboarding/onboarding_view.dart';
import 'package:kispay_merchant/bottom_nav/main_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/emailconfirmation_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/forgetpassword_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/profile_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/signup_screen.dart';
import 'package:kispay_merchant/presentation/screens/auth/updateUserInformation_screen.dart';
import 'package:kispay_merchant/presentation/screens/banks_screen.dart';
import 'package:kispay_merchant/presentation/screens/curve_navigation/curve_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:kispay_merchant/presentation/screens/customers_list_screen.dart';
import 'package:kispay_merchant/presentation/screens/editPassword_screen.dart';
import 'package:kispay_merchant/presentation/screens/payment_link_screen.dart';
import 'package:kispay_merchant/presentation/screens/qr_payment_screen.dart';
import 'package:kispay_merchant/presentation/screens/refund_screen.dart';
import 'package:kispay_merchant/presentation/screens/report_screen.dart';
import 'package:kispay_merchant/presentation/screens/setting_screen.dart';
import 'package:kispay_merchant/presentation/screens/settle_funds_screen.dart';
import 'package:kispay_merchant/presentation/screens/splash_screen.dart';
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
  static const String profile = '/profile';
  static const String splash = '/splash';
  static const String customersList = '/customers_list';
  static const String paymentLinks = '/payment_links';
  static const String settleFunds = '/settle_funds';
  static const String refund = '/refund';
  static const String qrPayment = '/qr_payment';
  static const String report = '/report';
  static const String setting = '/setting';
  static const String updateUserInformation = '/update_user_information';
  static const String editPassword = '/edit_password';

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
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      binding: CombinedBinding(),
    ),

    GetPage(
      name: splash,
      page: () => SplashScreen(),
      binding: CombinedBinding(),
    ),

    GetPage(
      name: customersList,
      page: () => CustomersListScreen(),
      binding: CombinedBinding(),
    ),

    GetPage(
      name: paymentLinks,
      page: () => PaymentLinksScreen(),
      binding: CombinedBinding(),
    ),


    GetPage(
      name: settleFunds,
      page: () => SettleFundScreen(),
      // binding: CombinedBinding(),
    ),

    GetPage(
      name: refund, 
      page: () => RefundScreen(),
      ),

      GetPage(
        name: qrPayment,
        page: () => QRPaymentScreen(),
      ),

      GetPage(
        name: report,
        page: () => ReportScreen(),
      ),

      GetPage(
        name: setting,
        page: () => SettingsScreen(),
      ),

      GetPage(
        name: updateUserInformation,
        page: () => EditProfileScreen(),
      ),

      GetPage(
        name: editPassword,
        page: () => ChangePasswordScreen(),
      ),  

  ];
}