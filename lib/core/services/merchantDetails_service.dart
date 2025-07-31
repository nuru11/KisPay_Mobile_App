// lib/core/services/auth_service.dart
import 'package:kispay_merchant/data/models/merchantDetails_model.dart';
import 'package:kispay_merchant/data/models/updateUserInformation_model.dart';

import 'api_service.dart';

class MerchantDetailsService {
  final ApiService apiService;

  MerchantDetailsService({required this.apiService});

  Future<MerchantDetailResponse> merchantDetails(String token) async {
    final data = await apiService.merchantDetails(token);
    return MerchantDetailResponse.fromJson(data);
  }


  Future<UpdateUserInformation> updateProfile({
  required String token,
  required String userId,
  required String firstName,
  required String middleName,
  required String lastName,
}) async {
  
  final data = await apiService.updateProfile(
    token: token,
    userId: userId,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
  );
  return UpdateUserInformation.fromJson(data);
}

}

  
