// lib/data/repositories/auth_repository.dart
import 'package:kispay_merchant/data/models/forgetPassword_model.dart';
import 'package:kispay_merchant/data/models/register_model.dart';

import '../../core/services/auth_service.dart';
import '../models/login_model.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({required this.authService});

  Future<LoginResponse> login(String email, String password) async {
    return await authService.login(email, password);
  }


  Future<RegisterResponse> register(String firstName, String middleName, String lastName, String email, String password) async {
    return await authService.register(firstName, middleName, lastName, email, password);
  }


  Future<RegisterResponse> resendConfirmationEmail(String email, ) async {
    return await authService.resendConfirmationEmail( email);
  }


  Future<ForgetPasswordResponse> forgetPassword(String email, ) async {
    return await authService.forgetPassword( email);
  }


}