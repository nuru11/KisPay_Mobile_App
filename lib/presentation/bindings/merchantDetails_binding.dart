import 'package:kispay_merchant/core/services/merchantDetails_service.dart';
import 'package:kispay_merchant/data/repositories/merchantDetails_respository.dart';
import 'package:kispay_merchant/presentation/controllers/merchantDetails_controller.dart';
import 'package:get/get.dart';
import '../../core/services/api_service.dart';
import '../../core/services/secure_storage.dart';

class MerchantDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApiService());
    Get.lazyPut(() => MerchantDetailsService(apiService: Get.find()));
    Get.lazyPut(() => SecureStorage());
    Get.lazyPut(() => MerchantDetailsRepository(merchantDetailsService: Get.find()));
    Get.lazyPut(() => MerchantDetailsController(
          merchantDetailsRepository: Get.find(),
          secureStorage: Get.find(), 
        ));
  }
}