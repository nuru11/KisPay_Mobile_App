// lib/core/services/api_service.dart
import 'dart:convert';
// import 'package:kispay_merchant/core/constant/api_endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:kispay_merchant/core/constant/api_endpoints.dart';
// import '../constants/api_endpoints.dart';

class ApiService {
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      ).timeout(Duration(seconds: 30));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data.containsKey('body')) {
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid email or password');
      } else {
        throw Exception(data['message'] ?? 'Login failed');
      }
    } catch (e) {
      throw Exception('Login error: $e');
    }
  }


  Future<Map<String, dynamic>> register(String firstName, String middleName, String lastName, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.register),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'firstName': firstName, 'middleName': middleName, 'lastName': lastName, 'email': email, 'password': password}),
      ).timeout(Duration(seconds: 30));

      final data = jsonDecode(response.body);
      if (response.statusCode == 201 && data.containsKey('body')) {
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid Data');
      } else {
        throw Exception(data['message'] ?? 'Register failed');
      }
    } catch (e) {
      throw Exception('Register error: $e');
    }
  }


  Future<Map<String, dynamic>> resendConfirmationEmail( String email) async {
    try {
      final response = await http.put(
        Uri.parse(ApiEndpoints.resendConfirmationEmail),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      ).timeout(Duration(seconds: 30));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data.containsKey('body')) {
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid Data');
      } else {
        throw Exception(data['message'] ?? 'Resend Email Confirmation failed');
      }
    } catch (e) {
      throw Exception('Confirmation Email error: $e');
    }
  }


  Future<Map<String, dynamic>> forgetPassword( String email) async {
    try {
      final response = await http.post(
        Uri.parse(ApiEndpoints.forgetPassword),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      ).timeout(Duration(seconds: 30));

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 ) {
        return data;
      } else if (response.statusCode == 401) {
        throw Exception('Invalid Data');
      } else {
        throw Exception(data['message'] ?? 'Forget Password failed');
      }
    } catch (e) {
      throw Exception('Forget Password error: $e');
    }
  }



  Future<Map<String, dynamic>> merchantDetails(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ApiEndpoints.merchantDetails),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final data = jsonDecode(response.body);
      if (response.statusCode == 200 && data.containsKey('body')) {
        return data;
      }  else {
        throw Exception(data['message'] ?? 'Merchant details failed');
      }
    } catch (e) {
      throw Exception('Merchant details error: $e');
    }
  }


  Future<Map<String, dynamic>> updateProfile({
  required String token,
  required String userId,
  required String firstName,
  required String middleName,
  required String lastName,
}) async {
  try {
    final response = await http.put(
      Uri.parse(ApiEndpoints.updateUserInformation),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'firstName': firstName,
        'middleName': middleName,
        'lastName': lastName,
      }),
    ).timeout(Duration(seconds: 30));

    final data = jsonDecode(response.body);
    if (response.statusCode == 200 && data.containsKey('body')) {
      merchantDetails(token); // Refresh merchant details after update
      return data;
    } else {
      throw Exception(data['message'] ?? 'Update profile failed');
    }
  } catch (e) {
    throw Exception('Update profile error: $e');
  }
}

}