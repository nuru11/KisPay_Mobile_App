// lib/data/repositories/auth_repository.dart
import 'package:kispay_merchant/core/services/merchantDetails_service.dart';
import 'package:kispay_merchant/data/models/merchantDetails_model.dart';
import 'package:kispay_merchant/data/models/updateUserInformation_model.dart';


class MerchantDetailsRepository {
  final MerchantDetailsService merchantDetailsService;

  MerchantDetailsRepository({required this.merchantDetailsService});

  Future<MerchantDetailResponse> merchantDetails(String token) async {
    return await merchantDetailsService.merchantDetails(token);
  }


  Future<UpdateUserInformation> updateProfile({
  required String token,
  required String userId,
  required String firstName,
  required String middleName,
  required String lastName,
}) async {
  return await merchantDetailsService.updateProfile(
    token: token,
    userId: userId,
    firstName: firstName,
    middleName: middleName,
    lastName: lastName,
  );
}

}