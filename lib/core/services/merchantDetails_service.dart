// lib/core/services/auth_service.dart
import 'package:kispay_merchant/data/models/merchantDetails_model.dart';

import 'api_service.dart';

class MerchantDetailsService {
  final ApiService apiService;

  MerchantDetailsService({required this.apiService});

  Future<MerchantDetailResponse> merchantDetails(String token) async {
    final data = await apiService.merchantDetails(token);
    return MerchantDetailResponse.fromJson(data);
  }
}

  
