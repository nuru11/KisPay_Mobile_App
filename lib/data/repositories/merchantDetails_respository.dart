// lib/data/repositories/auth_repository.dart
import 'package:kispay_merchant/core/services/merchantDetails_service.dart';
import 'package:kispay_merchant/data/models/merchantDetails_model.dart';


class MerchantDetailsRepository {
  final MerchantDetailsService merchantDetailsService;

  MerchantDetailsRepository({required this.merchantDetailsService});

  Future<MerchantDetailResponse> merchantDetails(String token) async {
    return await merchantDetailsService.merchantDetails(token);
  }
}