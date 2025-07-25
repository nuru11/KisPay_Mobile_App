// lib/core/constants/api_endpoints.dart
class ApiEndpoints {
  static const String baseUrl = 'https://api.afropay.co/api';

  /* Authentication */
  static const String login = '$baseUrl/auth/login';
  static const String register = '$baseUrl/auth/register';
  static const String resendConfirmationEmail = "$baseUrl/auth/resend-verification-email";
  static const String forgetPassword = "$baseUrl/auth/forgot-password";


  
  static const String merchantDetails = '$baseUrl/merchants/self';



  static const String initiatePayment = '$baseUrl/payments/initiate';
  static const String transactionHistory = '$baseUrl/transactions';
}


