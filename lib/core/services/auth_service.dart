// lib/core/services/auth_service.dart
import 'package:kispay_merchant/data/models/forgetPassword_model.dart';
import 'package:kispay_merchant/data/models/register_model.dart';

import '../../data/models/login_model.dart';
import 'api_service.dart';

class AuthService {
  final ApiService apiService;

  AuthService({required this.apiService});

  Future<LoginResponse> login(String email, String password) async {
    final data = await apiService.login(email, password);
    return LoginResponse.fromJson(data);
  }

  Future<RegisterResponse> register(String firstName, String middleName, String lastName, String email, String password) async {
    final data = await apiService.register(firstName, middleName, lastName, email, password);
    return RegisterResponse.fromJson(data);

  }

    Future<RegisterResponse> resendConfirmationEmail( String email,) async {
    final data = await apiService.resendConfirmationEmail(email);
    return RegisterResponse.fromJson(data);
  }


  Future<ForgetPasswordResponse> forgetPassword( String email,) async {
    final data = await apiService.forgetPassword(email);
    return ForgetPasswordResponse.fromJson(data);
  }

  
}